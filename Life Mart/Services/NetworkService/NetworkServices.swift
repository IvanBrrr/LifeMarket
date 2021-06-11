//
//  NetworkServices.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import Foundation

import Moya

enum RequestStatus {
    case ok
    case error
    case fail
}
enum ViewModelState {
    case success
    case failure
}

typealias Params = [String:Any]

enum NetworkServices {
    case postRegister(phone:String)
}

extension NetworkServices: TargetType {
    static let provider = MoyaProvider<NetworkServices>(plugins: [NetworkLoggerPlugin()])
    
    var baseURL: URL {
        let baseUrl = "https://dev-su.lifemart.ru/api/"// RELEASE
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
   
            
        //MARK:- Authentication
        case .postRegister: return "user/register"
              
        }
    }
    
    var method: Moya.Method {
        switch self {
        //MARK:- Authentication
        case .postRegister: return .post
            
     
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        //MARK:- Authentication
        case .postRegister(let phone): return .requestParameters(parameters: ["phone":phone], encoding: JSONEncoding.default)
        }
    }
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
        
    }
    
    
    
}
