//
//  PharmacyViewModel.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import Foundation
import UIKit
import RxSwift

class PharmacyViewModel {
    fileprivate let service = NetworkDataServices()
    var message: String = "Ошибка сервера"
    var company:[SearchModelCompany] = []
    var companyID:Int = -100
    init() {}
    
    
    func fetcCompany() -> Completable {
        return .create { [self] observer in
            service.requestCompant(with: false).subscribe { data in
                company = data
                observer(.completed)
            } onError: { error in
                message = "\(error)"
                print("ERROR:: \(message)  \(error.localizedDescription)")
                observer(.error(error))
            }
        }
    }
    
 
    func mySegue(parent:UIViewController,info:SearchModelCompany){
        let vc = ProductsVC(viewModel: ProductsViewModel(companyId: companyID, companyInfo: info))
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        parent.present(vc, animated: true, completion: nil)
    }
}
