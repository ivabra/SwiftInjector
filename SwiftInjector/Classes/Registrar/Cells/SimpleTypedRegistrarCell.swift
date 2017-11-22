//
//  SimpleTypedRegistrarCell.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

/// Cell for containing simple object dependecy
final class SimpleTypedRegistrarCell<T> : TypeRegistrarCell {

  let object: T
  
  init(object: T) {
    self.object = object
  }
  
  func getInstance(args: [Any]) -> Any {
    return object
  }
}
