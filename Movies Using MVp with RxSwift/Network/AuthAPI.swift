//
//  AuthAPI.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Alamofire
enum AuthAPI {
    case showMovies
}
extension AuthAPI: TargetType {
    var baseURL: String {
        switch self {
        case .showMovies:
            return Endpoints.baseURL + Endpoints.ShowData
            
        }
    }
    
    var path: String {
        return ""
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .showMovies:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .showMovies:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .showMovies:
            return nil
        }
    }
    
    var auth: [String : String]? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    
}
