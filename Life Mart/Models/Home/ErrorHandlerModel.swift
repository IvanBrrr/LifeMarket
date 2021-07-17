//
//  ErrorHandlerModel.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import Foundation
import Moya
import RxSwift

struct ErrorHandlerModelRootClass : Codable {
    let name : String?
    let message : String?
    let code : Int?
    let status : Int?
    let previous : ErrorHandlerModelPrevious?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case message = "message"
        case code = "code"
        case status = "status"
        case previous = "previous"
    }
}
struct ErrorHandlerModelPrevious : Codable {
    let name : String?
    let message : String?
    let code : Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case message = "message"
        case code = "code"
    }
}
enum ExampleError: Error {
    case unknow
    case with(message:String)
    
    init(message:String){
        switch message {
        default: self = message.isEmpty ? .unknow : .with(message: message)
            
        }
    }
}
extension PrimitiveSequence where Trait ==  SingleTrait, Element == Response {
    func catchMyError(_ type: ErrorHandlerModelRootClass.Type) -> Single<Element>{
        return flatMap { response in
            guard (200...299).contains(response.statusCode) else {
                do {
                    let errors = try response.map(type.self)
                    throw ExampleError(message: errors.message ?? "some thing went wrong")
                } catch {throw error}
            }
            return .just(response)
        }
    }
    
}
