//
//  SearchVC.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 16/07/21.
//

import Foundation
import UIKit
import RxSwift


enum SortModel:String {
    case price = "price"
    case distance = "distance"
}

class SearchViewModel {
    fileprivate let service = NetworkDataServices()
    var message: String = "Ошибка сервера"
    var sort: String = SortModel.price.rawValue
    var searchResult:[SearchModelRootClass] = []
    var companyId:Int = -1000
    init() {}
    

    func fetchSearch(with isOpenNow: Bool,shortName:String,sortBy:String) -> Completable {
        return .create { [self] observer in
            service.requesForSearch(with: isOpenNow, shortName: shortName, sortBy: sortBy).subscribe { data in
                searchResult = data
                observer(.completed)
            } onError: { error in
                message = "\(error)"
                print("ERROR:: \(message)  \(error.localizedDescription)")
                observer(.error(error))
            }
        }
    }
    
    func mySegue(parent:UIViewController,info:SearchModelCompany){
        let vc = ProductsVC(viewModel: ProductsViewModel(companyId: companyId, companyInfo: info))
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        parent.present(vc, animated: true, completion: nil)
    }
}
