//
//  DefaultTypeRegistrar.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

final class DefaultTypeRegistrar : TypeRegistrar {
  
  enum LocalError : Error {
    case typeIsNotRegistered(type: Any.Type)
    case objectCannotBeConvertedToType(object: Any, type: Any.Type)
    
    var localizedDescription: String {
      switch self {
      case let .typeIsNotRegistered(type):
        return "Type \(type) is not registered"
      case let .objectCannotBeConvertedToType(object, type):
        return "Object \(object) cannot be converted to \(type)"
      }
    }
  }
  
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
  
  func resolve<T>(_ type: T.Type) throws -> T {
    let key = mapTypeToKey(type)
    guard var cell: TypeRegistrarCell = storage[key] else {
      throw LocalError.typeIsNotRegistered(type: type)
    }
    let object = cell.getInstance()
    guard let typedObject = object as? T else {
      throw LocalError.objectCannotBeConvertedToType(object: object, type: type)
    }
    storage[key] = cell
    return typedObject
  }
  
  private func mapTypeToKey<T>(_ type: T.Type) -> Int {
    return ObjectIdentifier(type).hashValue
  }
  
}
