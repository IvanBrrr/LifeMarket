//
//  SignInViewModel.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import Foundation
import UIKit

enum VerificationTypeModel: String {
    case whatsApp       = "WhatsApp"
    case telegram      =  "Telegram"
    case sms           = "SMS"
    
    
    var image: String {
        switch self {
        case .whatsApp:
            return "identityCard"
        case .telegram:
            return "driversLicent"
        case .sms:
            return "passport"
        }
    }
    
}




class SignInViewModel {
    var tools = [VerificationTypeModel]()
    fileprivate let service = NetworkDataServices()
    var message: String?
    init() {
        tools = [VerificationTypeModel.whatsApp, .telegram,.sms]
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
    func initCollectionPhotosView(collectionView:UICollectionView){
        let screenRectWidth = UIScreen.main.bounds.size.width
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: (screenRectWidth - 54) / 3 , height: 70)
        
    }
    
    func phoneNumber(phone: String) -> String {
        let number = phone.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "+7", with: "")
    
        print("number  :: \(number)")
        return number
    }
    
}
