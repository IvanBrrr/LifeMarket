//
//  AuthenticationModel.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import Foundation

struct RegisterResponseRootClass : Codable {
    let success : Bool?
    let errorCode : String?
    let errorMessage : String?

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
}


