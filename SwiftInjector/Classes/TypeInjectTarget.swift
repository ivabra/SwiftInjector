//
//  TypeInjectTarget.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

/// If you extending with this protocol
/// then you will have type-global injecting on extended type
public protocol StaticInjectTarget {
  static var injector: Injector { get }
}

public extension StaticInjectTarget {
  
  var injector: Injector {
    return type(of: self).injector
  }
  
  /// Onject-local injection function
  /// - Returns: injected object
  /// - Throws: Error when
  static func get<T>(_ type: T.Type) -> T {
    return injector.get(type)
  }
  
  /** Lazy injection
   - Parameters:
   - type: Type that uniquely identity the dependency
   - Returns: Closure that can be used for lazy variable initialization.
   If dependency cannot be resolved, the closure throws fatal error
   */
  static func lazyGet<T>(_ type: T.Type) -> () -> T {
    return injector.lazyGet(type)
  }
}
