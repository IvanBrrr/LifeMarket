//
//  VerificationCodeViewModel.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import Foundation
import UIKit

class VerificationCodeViewModel {
    var tools = [VerificationTypeModel]()
    fileprivate let service = NetworkDataServices()
    var message: String?
    var phonenumber: String = ""
    
    init(phonenumber:String) {
        self.phonenumber = phonenumber
    }
    
    func fetchegister(phone:String,completion: @escaping ((ViewModelState) -> Void)) {
        service.requestRegister(with: phone){ (data, error) in
            if let error = error {
                self.message = error.localizedDescription
                print("error: \(error)")
                completion(.failure)
                return
            }else if  data?.success == false {
                self.message = data?.errorMessage  ?? "smth went wrong"
                completion(.failure)
                return
            }
            completion(.success)
        }
    }
    
    
}
