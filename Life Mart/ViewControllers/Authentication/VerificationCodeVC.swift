//
//  VerificationCodeVC.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import UIKit

class VerificationCodeVC: UIViewController {

    var  viewModel : VerificationCodeViewModel!

    @IBOutlet weak var bottomMoveUp: NSLayoutConstraint!
    @IBOutlet weak var topMoveUp: NSLayoutConstraint!
    
    init(viewModel: VerificationCodeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "VerificationCodeVC", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillShow(_:)),name: UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillHide(_:)),name: UIResponder.keyboardWillHideNotification,object: nil)
        
    }
    
    @objc dynamic func keyboardWillShow( _ notification: NSNotification) {
        animateWithKeyboard(notification: notification) {
            (keyboardFrame) in
            let constant =  keyboardFrame.height - 20
            self.bottomMoveUp?.constant = constant
            self.topMoveUp?.constant  = -50
            
        }
    }
    @objc dynamic func keyboardWillHide(_ notification: NSNotification) {
        animateWithKeyboard(notification: notification) {
            (keyboardFrame) in
            self.bottomMoveUp?.constant = 20
            self.topMoveUp?.constant  = 0

        }
    }


}
