//
//  Container.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

public protocol Container {
  func add<T>(_ type: T.Type, factory: @escaping (_ resolver: Injector, _ args: [Any])->T)
  func addSingleton<T>(_ type: T.Type, factory: @escaping (_ resolver: Injector)->T)
}

public extension Container {
  func add<T>(_ type: T.Type, factory: @escaping (_ args: [Any])->T) {
    add(type) { (_ : Injector, args: [Any]) in factory(args) }
  }
  func add<T>(_ type: T.Type, factory: @escaping ()->T) {
    add(type) { (_, _) in factory() }
  }
  func addSingleton<T>(_ type: T.Type, object: T) {
    addSingleton(type, factory: { _ in object })
  }
  func addSingleton<T>(_ type: T.Type, factory: @escaping ()->T) {
    addSingleton(type, factory: { _ in factory() })
  }
}
