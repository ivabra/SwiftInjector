//
//  AppDelegate.swift
//  SwiftInjector-Example
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import UIKit
import SwiftInjector
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    InjectHolder.setFabric { container, _ in
      container.addSingleton(MyFileManager.self) {
        let fm = DefaultMyFileManager()
        fm.createDocument(name: "Sample Document 1.txt", contents: "Sample text".data(using: .utf8)!)
        fm.createDocument(name: "Sample Document 2.txt", contents: "Sample text 2".data(using: .utf8)!)
        return fm
      }
    }
    InjectHolder.inject()
    return true
  }


}

