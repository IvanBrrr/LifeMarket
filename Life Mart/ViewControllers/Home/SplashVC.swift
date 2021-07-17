//
//  SplashVC.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import UIKit

class SplashVC: UIViewController {

    var  viewModel : SplashViewModel!
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SplashVC", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        viewModel.mySegue(parent: self)
    }

}
