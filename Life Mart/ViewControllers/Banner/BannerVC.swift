//
//  BannerVC.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import UIKit

class BannerVC: UIViewController {

    var  viewModel : BannerViewModel!

    init(viewModel: BannerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "BannerVC", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   

}
