//
//  NetworkDataServices.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import Foundation
import Moya
import RxSwift


class NetworkDataServices {
    private let provider = MoyaProvider<NetworkServices>(plugins: [NetworkLoggerPlugin()])
    private let disposeBag = DisposeBag()
    
    func requesForSearch(with isOpenNow:Bool,shortName:String,sortBy:String) -> Single<[SearchModelRootClass]>  {
        return provider.rx
            .request(.getByShortName(isOpenNow: isOpenNow, shortName: shortName, sortBy: sortBy))
            .catchMyError(ErrorHandlerModelRootClass.self)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([SearchModelRootClass].self)
    }
    func requesProduct(with companyId:Int) -> Single<[SearchModelRootClass]>  {
        return provider.rx
            .request(.getByCompanyId(companyId: companyId))
            .catchMyError(ErrorHandlerModelRootClass.self)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([SearchModelRootClass].self)
    }
    func requestCompant(with isOpenNow:Bool) -> Single<[SearchModelCompany]>  {
        return provider.rx
            .request(.getCompany(isOpenNow: isOpenNow))
            .catchMyError(ErrorHandlerModelRootClass.self)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([SearchModelCompany].self)
    }
    
    
}
