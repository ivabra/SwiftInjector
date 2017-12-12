//
//  DefaultContainer.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

public final class DefaultContainer : Container {
  
  fileprivate let registrar = DefaultTypeRegistrar()
  
  private lazy var localInjector: DefaultInjector = {
    DefaultInjector(registrar: self.registrar)
  }()

  public func add<T>(_ type: T.Type, factory: @escaping (Injector, [Any]) -> T) {
    let resolver = localInjector
    registrar.add(type) { (args: [Any]) -> T in
      let object = factory(resolver, args)
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

public extension DefaultContainer {
  func makeInjector() -> Injector {
    return DefaultInjector(registrar: self.registrar)
  }
}
