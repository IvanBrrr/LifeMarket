//
//  BannerViewModel.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import Foundation
import UIKit

class BannerViewModel {
    fileprivate let service = NetworkDataServices()
    var message: String?
    
    init() {}
    /*
    func fetchUser(completion: @escaping ((ViewModelState) -> Void)) {
        service.requestUserGet(with:myID){ (data, error,request_error) in
            if let error = error {
                self.message = error.localizedDescription
                print("error: \(error)")
                completion(.failure)
                return
            }else if  request_error != nil {
                self.message = request_error?.error?.message ?? "smth went wrong"
                completion(.failure)
                return
            }
            self.profileInfo = data?.response?.items?[0]
            LOConstantData.MY_INFORMATION = data?.response?.items?[0]
            completion(.success)
        }
    }
    */
}
