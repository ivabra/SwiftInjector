//
//  SingletonTypedRegistrarCell.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

/// Cell for containing singleton dependecy
struct SingletonTypedRegistrarCell: TypeRegistrarCell {
  
  var factory: () -> Any
  var cache: Any?
  
  init(factory: @escaping ()->Any) {
    self.factory = factory
  }
  
  mutating func getInstance() -> Any {
    if cache == nil {
      cache = factory()
    }
    return cache!
  }
}
