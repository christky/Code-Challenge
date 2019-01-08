//
//  LoginViewController.swift
//  Code-Challenge
//
//  Created by Kelsey Young on 1/7/19.
//  Copyright © 2019 Kelsey Young. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!

    @IBAction func loginBtnPressed(_ sender: Any) {
        if usernameTF.text?.lowercased() == "kobe" && passwordTF.text?.lowercased() == "champion" {
            performSegue(withIdentifier: "toFeed", sender: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
