//
//  SimpleTypedRegistrarCell.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

/// Cell for containing simple object dependecy
struct SimpleTypedRegistrarCell : TypeRegistrarCell {
  var object: Any
  func getInstance() -> Any {
    return object
  }
}
