//
//  APIClient.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    static func request<T: ResponseBase>(request: Request,
                 success:@escaping (T) -> Void,
                 failure:@escaping (APIError?) -> Void)
    {
        let c = APIConstants.default
        guard let url = c.url(for: request.kind) else {
            failure(.invalidURL)
            return
        }
        
        guard request.validate() else {
            failure(.invalidParameter)
            return
        }
        
        let method = c.httpMethod(for: request.kind)
        Alamofire.request(url, method: method, parameters: request.parameters)
            .validate(statusCode: 200..<400)
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(_):
                    if let json = response.result.value as? [String: Any] {
                        let helper = JsonHelper(json: json)
                        let res = T()
                        if res.process(responseJson: helper) {
                            success(res)
                            return
                        } else {
                            failure(.invalidResponseJson)
                            return
                        }
                    }
                    failure(.error(response.result.error))
                    break
                case .failure(_):
                    failure(.error(response.result.error))
                    break
                }
            })
    }
}
