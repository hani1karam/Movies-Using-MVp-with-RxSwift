//
//  APIClient.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
class APIClient {
    
    func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        var appError: AppError = AppError()
        
        //Create an RxSwift observable, which will be the one to call the request when subscribed to
   
        return Observable<T>.create { observer in
            
            //Trigger the HttpRequest using AlamoFire (AF)
            let request = AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
                //Check the result from Alamofire's response and check if it's a success or a failure
                //                print(response.request!)
                print(response.result)
                if let data = response.data {
                    print(String(data: data, encoding: .utf8)!)
                }
                
                switch response.result {
                case .success(let value):
                    //Everything is fine, return the value in onNext
                    
 
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    if !(NetworkReachabilityManager()?.isReachable ?? true || response.response?.statusCode == nil)  {
                        appError.errorCode = -1
                        appError.message = "No connections are available"
                        observer.onError(appError)
                    } else {
                        appError.errorCode = response.response?.statusCode
                        appError.message = error.localizedDescription
                        observer.onError(appError)
                    }
                }
            }
            
            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
