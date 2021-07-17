//
//  HomeVC.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 16/07/21.
//

import UIKit

class HomeVC: UIViewController {
    var  viewModel : HomeViewModel!


    @IBOutlet weak var searchView: UIView!
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "HomeVC", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView(){
        searchView.roundedCorners()
        searchView.drawShadow(forOpacity: 0.5, forOffset: .zero)
    }
    
    
    @IBAction func pharmacyTapped(_ sender: Any) {
        let vc = PharmacyVC(viewModel: PharmacyViewModel())
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
   
    @IBAction func searchTapped(_ sender: Any) {
        viewModel.mySegue(parent: self)
    }
    
}

