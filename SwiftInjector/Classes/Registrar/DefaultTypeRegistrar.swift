//
//  DefaultTypeRegistrar.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

final class DefaultTypeRegistrar : TypeRegistrar {
  
  typealias Key = ObjectIdentifier
  
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
  
  var storage: [Key : TypeRegistrarCell] = [:]
  var synchronizationQueue: DispatchQueue!
  
  init() {
    synchronizationQueue = DispatchQueue(label: "com.dantelab.SwiftInjector.\(type(of: self)).queue-synchronization-\(ObjectIdentifier(self).hashValue)", qos: .default, attributes: .concurrent, target: DispatchQueue.global(qos: .default))
  }
  
  func addSingleton<T>(_ type: T.Type, object: T) {
    setCell(SimpleTypedRegistrarCell(object: object), forKey: mapTypeToKey(type))
  }
  
  func add<T>(_ type: T.Type, factory: @escaping () -> T) {
    setCell(FactoryTypedRegistrarCell(factory: factory), forKey: mapTypeToKey(type))
  }
  
  func addSingletone<T>(_ type: T.Type, factory: @escaping () -> T) {
    setCell(SingletonTypedRegistrarCell(factory: factory), forKey: mapTypeToKey(type))
  }
  
  func resolve<T>(_ type: T.Type) throws -> T {
    let key = mapTypeToKey(type)
    guard let cell = readCell(forKey: key) else {
      throw LocalError.typeIsNotRegistered(type: type)
    }
    if let singltonCell = cell as? SingletonTypedRegistrarCell<T>, singltonCell.isCalledOnce == false {
      return synchronizationQueue.sync(flags: .barrier) {
        singltonCell.getTypedInstance()
      }
    }
    let object = cell.getInstance()
    guard let typedObject = object as? T else {
      throw LocalError.objectCannotBeConvertedToType(object: object, type: type)
    }
    return typedObject
  }
  
  private func setCell(_ cell: TypeRegistrarCell, forKey key: Key) {
    synchronizationQueue.sync(flags: .barrier) {
      storage[key] = cell
    }
  }
  
  private func readCellValue<T>(ofType type: T.Type, forKey key: Key) throws -> T {
    let key = mapTypeToKey(type)
    return try synchronizationQueue.sync {
      guard let cell = readCell(forKey: key) else {
        throw LocalError.typeIsNotRegistered(type: type)
      }
      let object = cell.getInstance()
      guard let typedObject = object as? T else {
        throw LocalError.objectCannotBeConvertedToType(object: object, type: type)
      }
      return typedObject
    }
  }
  
  private func readCell(forKey key: Key) -> TypeRegistrarCell? {
    return synchronizationQueue.sync { storage[key] }
  }
  
  private func readStorage<T>(_ block:  ([Key : TypeRegistrarCell]) throws -> T) rethrows -> T {
    return try synchronizationQueue.sync {
      try block(storage)
    }
  }
  
  private func writeStorage(block: (inout [Key : TypeRegistrarCell]) throws -> Void) rethrows {
    try synchronizationQueue.sync(flags: .barrier) {
      try block(&storage)
    }
  }
  
  private func mapTypeToKey<T>(_ type: T.Type) -> Key {
    return ObjectIdentifier(type)
  }
  
}
