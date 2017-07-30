//
//  StandardContainer.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

public final class StandardContainer : Container {
  
  fileprivate let registrar = DefaultTypeRegistar()
  
  private lazy var localInjector: StandardInjector = {
    StandardInjector(registrar: self.registrar)
  }()
  
  public func add<T>(_ type: T.Type, object: T) {
    registrar.add(type, object: object)
  }
  
  public func add<T>(_ type: T.Type, factory: @escaping () -> T) {
    registrar.add(type, factory: factory)
  }
  
  public func add<T>(_ type: T.Type, factory: @escaping (Injector) -> T) {
    let resolver = localInjector
    registrar.add(type) { () -> T in
      let object = factory(resolver)
      return object
    }
  }
  
  public func addSingleton<T>(_ type: T.Type, object: T) {
    registrar.addSingletone(type, factory: { object })
  }
  
  public func addSingleton<T>(_ type: T.Type, factory: @escaping () -> T) {
    registrar.addSingletone(type, factory: factory)
  }
  
  public func addSingleton<T>(_ type: T.Type, factory: @escaping (Injector) -> T) {
    let resolver = localInjector
    registrar.addSingletone(type) { () -> T in
      let object = factory(resolver)
      return object
    }
  }
  
}

public extension StandardContainer {
  func makeInjector() -> Injector {
    return StandardInjector(registrar: self.registrar)
  }
}
