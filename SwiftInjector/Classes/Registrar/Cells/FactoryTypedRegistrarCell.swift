//
//  FactoryTypedRegistrarCell.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

/// Cell for containing factory dependency
final class FactoryTypedRegistrarCell<T>: TypeRegistrarCell {
  
  let factory: ([Any]) -> T
  
  init(factory: @escaping ([Any]) -> T) {
    self.factory = factory
  }
  
  func getInstance(args: [Any]) -> Any {
    return factory(args)
  }
  
}
