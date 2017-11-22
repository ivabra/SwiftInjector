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
    - args: Arguments for the registered builder
  - Returns: Object that conforming to this dependency
  - Throws: Fatal error if dependency cannon be resolved
   */
  func get<T>(_ type: T.Type, args: [Any]) -> T
  
  /** Dependency resolving
  - Parameters:
    - type: Type that uniquely identity the dependency
    - args: Arguments for the registered builder
  - Returns: Object that conforming to this dependency or `nil`
   */
  func opt<T>(_ type: T.Type, args: [Any]) -> T?
}

public extension Injector {
  /** Dependency resolving
   - Parameters:
   - type: Type that uniquely identity the dependency
   - Returns: Object that conforming to this dependency
   - Throws: Fatal error if dependency cannon be resolved
   */
  func get<T>(_ type: T.Type) -> T {
    return get(type, args: [])
  }
  
  /** Dependency resolving
   - Parameters:
   - type: Type that uniquely identity the dependency
   - Returns: Object that conforming to this dependency or `nil`
   */
  func opt<T>(_ type: T.Type) -> T? {
    return opt(type, args: [])
  }
  
  /** Lazy injection
   - Parameters:
     - type: Type that uniquely identity the dependency
   - Returns: Closure that can be used for lazy variable initialization. 
              If dependency cannot be resolved, the closure throws fatal error
   */
  func lazyGet<T>(_ type: T.Type) -> () -> T {
    return { self.get(type) }
  }
  
  /** Lazy injection
   - Parameters:
   - type: Type that uniquely identity the dependency
   - Returns: Closure that can be used for lazy variable initialization.
   If dependency cannot be resolved, closure call retuns nil
   */
  func lazyOpt<T>(_ type: T.Type) -> () -> T? {
    return { self.opt(type) }
  }
}
