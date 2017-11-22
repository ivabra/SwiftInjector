//
//  Default.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

private let _InjectHolder = DefaultInjectionHolder()

/// Default injection holder
public var InjectHolder: InjectionHolder { return _InjectHolder }

/// Default global injector
public var Inject: Injector = ProxyInjector { _InjectHolder.injector }

final class ProxyInjector : Injector {
  let injector: () -> Injector
  
  init(proxied: @escaping () -> Injector) {
    self.injector = proxied
  }
  
  func get<T>(_ type: T.Type, args: [Any]) -> T {
    return injector().get(type, args: args)
  }
  
  func opt<T>(_ type: T.Type, args: [Any]) -> T? {
    return injector().opt(type, args: args)
  }
}

/// Like `InjectTarget` but injection default global injector 
/// that can be accessed by global `Inject` properly
public protocol DefaultInjectTarget: InjectTarget { }

extension DefaultInjectTarget {
  public var injector: Injector { return Inject }
}
