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
  
  let factory: () -> T
  
  init(factory: @escaping () -> T) {
    self.factory = factory
  }
  
  func getInstance() -> Any {
    return factory()
  }
  
}
