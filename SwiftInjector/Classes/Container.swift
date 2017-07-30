//
//  Container.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

public protocol Container {
  func add<T>(_ type: T.Type, factory: @escaping ()->T)
  func add<T>(_ type: T.Type, factory: @escaping (_ resolver: Injector)->T)
  func addSingleton<T>(_ type: T.Type, object: T)
  func addSingleton<T>(_ type: T.Type, factory: @escaping ()->T)
  func addSingleton<T>(_ type: T.Type, factory: @escaping (_ resolver: Injector)->T)
}
