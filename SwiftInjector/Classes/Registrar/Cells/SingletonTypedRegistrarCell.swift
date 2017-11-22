//
//  SingletonTypedRegistrarCell.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

/// Cell for containing singleton dependecy
final class SingletonTypedRegistrarCell<T>: TypeRegistrarCell {
  
  private let factory: () -> T
  private var cache: T!
  
  init(factory: @escaping () -> T) {
    self.factory = factory
  }
  
  func getTypedInstance() -> T {
    if cache == nil {
      cache = factory()
    }
    return cache
  }
  
  func getInstance(args: [Any]) -> Any {
    return getTypedInstance()
  }
}

extension SingletonTypedRegistrarCell {
  var isCalledOnce: Bool {
    return cache != nil
  }
}
