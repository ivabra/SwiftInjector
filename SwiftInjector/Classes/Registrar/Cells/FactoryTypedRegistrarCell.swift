//
//  FactoryTypedRegistrarCell.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

/// Cell for containing factory dependency
struct FactoryTypedRegistrarCell: TypeRegistrarCell {
  var factory: () -> Any
  func getInstance() -> Any {
    return factory()
  }
}
