//
//  TargetTypr.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Alamofire

protocol TargetType: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var auth: [String: String]? { get }
    var encoding: ParameterEncoding { get }
}

extension TargetType {
    // return request after create url and add header and parameters
    func asURLRequest() throws -> URLRequest {
        var finalURL = URL(string: baseURL)
        finalURL = finalURL?.appendingPathComponent(path)
        guard let url = finalURL else {
            throw NSError(
                domain: "",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Could not get URL"]
            )
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        if let auth = auth {
            if let username = auth["username"], let password = auth["password"] {
                let loginString = String(format: "%@:%@", username, password)
                if let loginData = loginString.data(using: String.Encoding.utf8) {
                    let base64LoginString = loginData.base64EncodedString()
                    urlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
                }
            } else if let token = auth["token"] {
                urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
            
        }
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.timeoutInterval = TimeInterval(15 * 1000)
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}
