//
//  ProductsViewModel.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import Foundation
import UIKit
import RxSwift


class ProductsViewModel {
    fileprivate let service = NetworkDataServices()
    var message: String = "Ошибка сервера"
    var sort: String = SortModel.price.rawValue
    var product:[SearchModelRootClass] = []
    var companyInfo : SearchModelCompany?
    var companyId:Int = 0
    
    var lat:Double = 0.0
    var long : Double = 0.0
    
    init(companyId:Int,companyInfo : SearchModelCompany) {
        self.companyId = companyId
        self.companyInfo = companyInfo
        getLocation()
    }
    
    
    func fetcProduct(with isOpenNow: Bool) -> Completable {
        return .create { [self] observer in
            service.requesProduct(with: companyId).subscribe { data in
                product = data
                observer(.completed)
            } onError: { error in
                message = "\(error)"
                print("ERROR:: \(message)  \(error.localizedDescription)")
                observer(.error(error))
            }
        }
    }
    
    
    func getLocation() {
        if companyInfo != nil {
            let location = companyInfo?.geo?.components(separatedBy: ",")
            let latS: String = location![0]
            let longS: String? = location!.count > 1 ? location![1] : "0.0"
            
            
            print( "lats: \(latS)")
            print( "longS: \(longS)")

            let longD = Double(longS ?? "0.0")
            let latD = Double(latS)
            
            lat = latD ?? 0.0
            long = longD ?? 0.0
            
            
        }
        
    }
    
  
    
    func mySegueMap(parent:UIViewController){
        let vc = MapVC(viewModel: MapViewModel(long: long , lat: lat))
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        parent.present(vc, animated: true, completion: nil)
    }
}
