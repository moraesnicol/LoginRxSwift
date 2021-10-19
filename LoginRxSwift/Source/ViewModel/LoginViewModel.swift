//
//  LoginViewModel.swift
//  LoginRxSwift
//
//  Created by Gabriel on 19/10/21.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    
    let userNameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(userNameTextPublishSubject.asObservable(), passwordTextPublishSubject.asObservable().startWith("")).map { username, password in
            return username.count > 3 && password.count > 3
        }.startWith(false)
    }
}
