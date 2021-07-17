//
//  HomeViewModel.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 16/07/21.
//

import Foundation
import UIKit
class HomeViewModel {
    fileprivate let service = NetworkDataServices()
    var message: String = "Ошибка сервера"
    init() {}
    
    
    
    func mySegue(parent:UIViewController){
     
        /*
       // let vm = MyProfileViewModel(ids: viewModel.myID ?? -100)
        let yourViewController = SearchVC(viewModel: SearchViewModel())
        let navigationController = UINavigationController(rootViewController: yourViewController)
        navigationController.navigationBar.barTintColor = Color.main
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.isTranslucent = false
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalTransitionStyle = .crossDissolve
       
        parent.present(navigationController, animated: true, completion: nil)
        
        */
      
        let vc = SearchVC(viewModel: SearchViewModel())
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        parent.present(vc, animated: true, completion: nil)
    }
}
