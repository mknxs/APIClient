//
//  Request.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation

protocol Request {
    
    /**
     * リクエストパラメータのバリデーション.
     */
    func validate() -> Bool
    
    /**
     * リクエストパラメータを取得.
     */
    var parameters: Dictionary<String, Any> { get }
    
    /**
     * APIの種別を取得
     */
    var kind: APIConstants.Kind { get }
}
