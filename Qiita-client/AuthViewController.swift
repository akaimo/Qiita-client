//
//  AuthViewController.swift
//  Qiita-client
//
//  Created by Shuhei Kawaguchi on 2016/02/10.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit
import APIKit

class AuthViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func endNameField(sender: AnyObject) {
        self.passwordTextField.becomeFirstResponder()
    }

    @IBAction func endPasswordField(sender: AnyObject) {
        self.tapLoginBtn(self)
    }
    
    @IBAction func tapLoginBtn(sender: AnyObject) {
        guard let name = self.nameTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        
        let request = AuthAPI(name: name, password: password)
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                QiitaAccessToken = response.token
                
            case .Failure(let error):
                print("error \(error)")
            }
        }
    }

}
