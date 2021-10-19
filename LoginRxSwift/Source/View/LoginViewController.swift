//
//  ViewController.swift
//  LoginRxSwift
//
//  Created by Gabriel on 18/10/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.becomeFirstResponder()
        
        userNameTextField.rx.text.map { $0 ?? ""}.bind(to:loginViewModel.userNameTextPublishSubject).disposed(by: disposeBag)
        passwordTextField.rx.text.map { $0 ?? ""}.bind(to:loginViewModel.passwordTextPublishSubject).disposed(by: disposeBag)
        
        loginViewModel.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValid().map { $0 ? 1 : 0.1 }.bind(to: loginButton.rx.alpha).disposed(by: disposeBag)
    }
    
    
    
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        print("tapped")
    }
}

