//
//  SplashViewController.swift
//  MovieApp
//
//  Created by ProdMac on 6.08.2022.
//

//import Foundation
//import UIKit
//
//final class SplashViewController : UIViewController , Layouting {
//
//    typealias ViewType = SplashView
//    override func loadView() {
//        view = ViewType.create()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        layoutableView.activityIndicator.startAnimating()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.layoutableView.activityIndicator.stopAnimating()
//            self.navigationController?.pushViewController(MovieListViewController(), animated: true)
//        }
//    }
//
//}

import UIKit

final class SplashViewController: UIViewController, Layouting, UIGestureRecognizerDelegate {
    
    typealias ViewType = SplashView
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        layoutableView.activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.layoutableView.activityIndicator.stopAnimating()
            self.navigationController?.pushViewController(MovieListViewController(), animated: true)
        }
    }
    
}

