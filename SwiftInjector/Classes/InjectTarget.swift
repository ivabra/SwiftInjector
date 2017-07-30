//
//  InjectTarget.swift
//  GoAboutApp
//
//  Created by Ivan Brazhnikov on 01.07.17.
//  Copyright © 2017 GoAbout. All rights reserved.
//

import Foundation

/// Implementing this protocol allow class to use local inject
public protocol InjectTarget {
  /// Injector for support object-local dependency injection
  var injector: Injector { get }
}

public extension InjectTarget {
  /// Onject-local injection function
  /// - Returns: injected object
  /// - Throws: Error when
  func inject<T>(_ type: T.Type) -> T {
    return injector.get(type)
  }
  
  /** Lazy injection
   - Parameters:
   - type: Type that uniquely identity the dependency
   - Returns: Closure that can be used for lazy variable initialization.
   If dependency cannot be resolved, the closure throws fatal error
   */
  func lazyGet<T>(_ type: T.Type) -> () -> T {
    return injector.lazyGet(type)
  }
}



