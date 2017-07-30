//
//  TypeRegistrar.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

public protocol TypeRegistrar : class {
  func resolve<T: Any>(_ type: T.Type) -> T
  func add<T>(_ type: T.Type, object: T)
  func add<T>(_ type: T.Type, factory: @escaping ()->T)
  func addSingletone<T>(_ type: T.Type, factory: @escaping ()->T)
}
