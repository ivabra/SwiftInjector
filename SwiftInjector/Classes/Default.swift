//
//  Default.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

private let _InjectHolder = DefaultInjectionHolder()
public var InjectHolder: InjectionHolder { return _InjectHolder }
public var Inject: Injector = ProxyInjector { _InjectHolder.injector }

final class ProxyInjector : Injector {
  
  let injector: () -> Injector
  
  init(proxied: @escaping () -> Injector) {
    self.injector = proxied
  }
  
  func get<T>(_ type: T.Type) -> T {
    return injector().get(type)
  }
}

public protocol DefaultInjectTarget: InjectTarget { }

extension DefaultInjectTarget {
  public var injector: Injector { return Inject }
}
