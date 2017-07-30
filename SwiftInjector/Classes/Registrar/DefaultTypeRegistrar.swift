//
//  DefaultTypeRegistrar.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

final class DefaultTypeRegistrar : TypeRegistrar {
  
  var storage: [Int : TypeRegistrarCell] = [:]
  
  func addSingleton<T>(_ type: T.Type, object: T) {
    let key = mapTypeToKey(type)
    storage[key] = SimpleTypedRegistrarCell(object: object)
  }
  
  func add<T>(_ type: T.Type, factory: @escaping ()->T) {
    let key = mapTypeToKey(type)
    storage[key] = FactoryTypedRegistrarCell(factory: factory)
  }
  
  func addSingletone<T>(_ type: T.Type, factory: @escaping ()->T) {
    let key = mapTypeToKey(type)
    storage[key] = SingletonTypedRegistrarCell(factory: factory)
  }
  
  func resolve<T>(_ type: T.Type) -> T {
    let key = mapTypeToKey(type)
    guard var cell: TypeRegistrarCell = storage[key] else {
      fatalError("The type \(type) is not registered")
    }
    let object = cell.getInstance()
    guard let typedObject = object as? T else {
      fatalError("Object \(object) cannot be converted to \(type)")
    }
    storage[key] = cell
    return typedObject
  }
  
  private func mapTypeToKey<T>(_ type: T.Type) -> Int {
    return ObjectIdentifier(type).hashValue
  }
  
}
