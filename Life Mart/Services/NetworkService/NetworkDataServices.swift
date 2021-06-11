//
//  NetworkDataServices.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import Foundation
import Moya

class NetworkDataServices {
    private let provider = MoyaProvider<NetworkServices>(plugins: [NetworkLoggerPlugin()])

    func requestRegister(with phone:String, completion: @escaping (RegisterResponseRootClass?, Error?) -> Void) {
        provider.request(.postRegister(phone: phone)){ result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder().decode(RegisterResponseRootClass.self, from: response.data)
                        completion(data, nil)
                } catch (let error) {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
