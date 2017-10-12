//
//  TypeRegistrar.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

/// The registrar that contains all dependencies
public protocol TypeRegistrar : class {
  /// Resolving dependency
  /// - Parameters:
  ///   - type:     Type that uniquely identifies the dependency
  /// - Returns: Object that conforming to this dependency
  /// - Throws: Error is type cannot be resolved
  func resolve<T: Any>(_ type: T.Type) throws -> T
  
  /// Adding dependency with factory closure
  /// - Parameters:
  ///   - type:     Type that uniquely identifies the dependency
  ///
  ///   - factory:  The fabric closure that makes object for every dependency resolving
  func add<T>(_ type: T.Type, factory: @escaping ()->T)
  
  /// Adding singletone dependency with factory closure
  /// - Parameters:
  ///   - type:     Type that uniquely identifies the dependency
  ///
  ///   - factory:  The fabric closure that will make object only once
  ///               and returns it for every dependecy resolving
  func addSingletone<T>(_ type: T.Type, factory: @escaping ()->T)
  
  /// Adding dependency
  /// - Parameters:
  ///   - type: Type that uniquely identifies the dependency
  ///   - object: The object that should resolve this dependecy
  func addSingleton<T>(_ type: T.Type, object: T)
}
