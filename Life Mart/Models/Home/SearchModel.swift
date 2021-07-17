//
//  SearchModel.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import Foundation
import AnyCodable

struct SearchModelRootClass : Codable {
    
    let id : Int?
    let company : SearchModelCompany?
    let product : SearchModelProduct?
    let recordDate : String?
    let count : Int?
    let price : Int?
    let distance : AnyCodable?
    
   
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case company = "company"
        case product = "product"
        case recordDate = "recordDate"
        case count = "count"
        case price = "price"
        case distance = "distance"
    }
}
struct SearchModelProduct : Codable {
    
    let id : Int?
    let name : String?
    let brand : SearchModelBrand?
    let bulk : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case brand = "brand"
        case bulk = "bulk"
    }
}
struct SearchModelBrand : Codable {
    
    let id : Int?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
struct SearchModelCompany : Codable {
    
    let id : Int?
    let name : String?
    let address : String?
    let geo : String?
    let phone : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case address = "address"
        case geo = "geo"
        case phone = "phone"
    }
}
