//
//  Injector.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

public protocol Injector: class {
  func get<T>(_ type: T.Type) -> T
}

public extension Injector {
  func lazyGet<T>(_ type: T.Type) -> () -> T {
    return { self.get(type) }
  }
}
