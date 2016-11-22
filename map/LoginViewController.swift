//
//  LoginViewController.swift
//  map
//
//  Created by Thomas Shouler on 11/21/16.
//  Copyright © 2016 Thomas Shouler. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
}

