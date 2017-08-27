//
//  ViewController.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let req = LoginRequest()
        req.loginId = "login"
        req.password = "password"
        APIClient.request(request: req, success: { (response: LoginResponse) in
            print("token: \(response.token ?? "")")
        }) { (error) in
            print(error ?? "unknown error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
