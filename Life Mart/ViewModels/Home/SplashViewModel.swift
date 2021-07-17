//
//  SplashViewModel.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import Foundation
import UIKit
class SplashViewModel {
    init() {}
    func mySegue(parent:UIViewController){
        let vc = HomeVC(viewModel: HomeViewModel())
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        parent.present(vc, animated: true, completion: nil)
    }
}
