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
    case getByShortName(isOpenNow:Bool,shortName:String,sortBy:String)
    case getByCompanyId(companyId:Int)
    case getCompany(isOpenNow:Bool)
}

extension NetworkServices: TargetType {
    static let provider = MoyaProvider<NetworkServices>(plugins: [NetworkLoggerPlugin()])
    
    var baseURL: URL {
        let baseUrl = "https://vet-find.herokuapp.com/"// RELEASE
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
   
        case .getByShortName: return "find/by-short-name"
        case .getByCompanyId: return "find/by-company-id"
        case .getCompany: return "company"

        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getByShortName,.getByCompanyId,.getCompany: return .get
            
     
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getByShortName(let isOpenNow, let shortName,let sortBy): return .requestParameters(parameters: ["isOpenNow":isOpenNow,"shortName":shortName,"sortBy":sortBy], encoding: URLEncoding.queryString)
        case .getByCompanyId(let companyId): return .requestParameters(parameters: ["companyId":companyId], encoding: URLEncoding.queryString)
        case .getCompany(let isOpenNow): return .requestParameters(parameters: ["isOpenNow":isOpenNow], encoding: URLEncoding.queryString)

        }
    }
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
        
    }
    
    
    
}
