//
//  TypedRegistrarCell.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

/// Cell that contains single dependecy
protocol TypeRegistrarCell: class {
  /// Getting instance of object that resolves dependency
  func getInstance() -> Any
}

