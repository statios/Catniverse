//
//  AppDelegate.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit
import Then
import Resolver

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    window = UIWindow().then {
      $0.frame = UIScreen.main.bounds
      $0.backgroundColor = .white
      $0.rootViewController = SplashViewController()
      $0.makeKeyAndVisible()
    }
    return true
  }
}
