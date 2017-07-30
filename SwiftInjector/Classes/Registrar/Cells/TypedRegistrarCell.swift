//
//  TypedRegistrarCell.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

protocol TypeRegistrarCell {
  mutating func getInstance() -> Any
}

