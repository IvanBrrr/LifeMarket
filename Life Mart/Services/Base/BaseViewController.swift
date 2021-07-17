//
//  BaseViewController.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import Foundation
import UIKit
import Reachability
import SwiftMessages
import RxSwift
import RxCocoa
import Moya
import JGProgressHUD


class BaseViewController: UIViewController, ReachabilityObserverDelegate {
    deinit { removeReachabilityObserver() }
    
    
    var searchShown:Bool = false
    
    func reachabilityChanged(_ isReachable: Bool) {
        if !isReachable {
            print("--- No internet connection")
            let alert = UIAlertController(title: "Ошибка", message: "\n Проверьте подключение к интернету", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Повторить", style: .default, handler: { action in
                                            switch action.style{
                                            case .default:
                                                print("default")
                                                self.viewDidLoad()
                                                
                                            case .cancel:
                                                print("cancel")
                                                
                                            case .destructive:
                                                print("destructive")
                                                
                                                
                                            @unknown default:
                                                print("destructive")
                                                
                                            }}))
            self.present(alert, animated: true, completion: nil)
        } else {
            print("--- Connected to internet")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addReachabilityObserver()
    }
    
    
    let hudLoading = JGProgressHUD(style: .dark)
    func startLoading(){
        hudLoading.show(in: self.view)
    }
    func stopLoading(){
        hudLoading.dismiss()
    }
 
    
    func snackView(msg:String, isError:Bool = true) {
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        view.iconImageView?.isHidden = true
        if isError{view.configureTheme(.error, iconStyle: .light)} else{ view.configureTheme(.success, iconStyle: .default)}
        var title:String = "Ошибка"
        if !isError{title = "Успешно"}
        view.configureContent(title: "\(title)", body: msg, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Закрыть", buttonTapHandler: {_ in
            SwiftMessages.hide(animated: true)
        })
        
        var config = SwiftMessages.defaultConfig
        config.duration = .seconds(seconds: 2)
        config.presentationStyle = .bottom
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.dimMode = .gray(interactive: true)
        SwiftMessages.show(config:config, view: view)
       
    }
    

}

