//
//  SignInVC.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import UIKit
import JMMaskTextField_Swift

class SignInVC: UIViewController {    
    @IBOutlet weak var mainImage: UIImageView!
    var  viewModel : SignInViewModel!
    @IBOutlet weak var phoneTextField: JMMaskTextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var bottomStack: NSLayoutConstraint!
    
    @IBOutlet weak var nextButton: LMButton!
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SignInVC", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        configureCollectionView()
        
        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillShow(_:)),name: UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillHide(_:)),name: UIResponder.keyboardWillHideNotification,object: nil)
    }
    
    @objc dynamic func keyboardWillShow( _ notification: NSNotification) {
        animateWithKeyboard(notification: notification) {
            (keyboardFrame) in
            
            self.mainImage.isHidden = true
            let constant =  keyboardFrame.height - 20
            self.bottomStack?.constant = constant
            
            
        }
    }
    @objc dynamic func keyboardWillHide(_ notification: NSNotification) {
        animateWithKeyboard(notification: notification) {
            (keyboardFrame) in
            self.bottomStack?.constant = 20
            self.mainImage.isHidden = false
            
        }
    }
    
    
    func initViews(){
        nextButton.isEnabled = false
        phoneTextField.roundedCorners()
        phoneTextField.setLeftPaddingPoints(8)
        phoneTextField.setRightPaddingPoints(8)
        
        phoneTextField.inputAccessoryView = LMHelper.getToolbarWithSelector(#selector(donePressed), target: self)
    }
    @objc func donePressed(sender:UIBarButtonItem) {
        phoneTextField.resignFirstResponder()
        phoneTextField.endEditing(true)
    }
    private func configureCollectionView() {
        viewModel.initCollectionPhotosView(collectionView: collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerNib(VerificationTypeCell.self)
        collectionView.registerHeader(UICollectionReusableView.self)
        collectionView.registerFooter(UICollectionReusableView.self)
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        if isValidation() {fetchData()}
    }
    
    @IBAction func skipTapped(_ sender: UIButton) {
    }
    
    func fetchData() {
        viewModel.fetchegister(phone:viewModel.phoneNumber(phone: phoneTextField.text ?? "")){ state in
            switch state {
            case .success: self.mySegue()
            case .failure: print("show error :: \(self.viewModel.message ?? "--")")
            }
        }
    }
    
    func isValidation() -> Bool {
        if phoneTextField.text == "" {print("fill phone number")
            return false
        }
        else if phoneTextField.text?.count ?? 0 < 18 {print("incorrect phone number")
            return false
        }
        
        return true
    }
    
    func mySegue(){
        let vm = VerificationCodeViewModel(phonenumber: phoneTextField.text ?? "")
        let vc = VerificationCodeVC(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
}


extension SignInVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VerificationTypeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.fill(with: viewModel.tools[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nextButton.customBackgroundColor = Color.main
        nextButton.isEnabled = true
    }
    
    
}

