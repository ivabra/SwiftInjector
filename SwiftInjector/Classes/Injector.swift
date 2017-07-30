//
//  Injector.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

public protocol Injector: class {
  /** Dependency resolving
   - Parameters:
     - type: Type that uniquely identity the dependency
   - Returns: Object that conforming to this dependency
   - Throws: Fatal error if dependency cannon be resolved 
   */
  func get<T>(_ type: T.Type) -> T
}

public extension Injector {
  /** Lazy injection
   - Parameters:
     - type: Type that uniquely identity the dependency
   - Returns: Closure that can be used for lazy variable initialization. 
              If dependency cannot be resolved, the closure throws fatal error
   */
  func lazyGet<T>(_ type: T.Type) -> () -> T {
    return { self.get(type) }
  }
}
