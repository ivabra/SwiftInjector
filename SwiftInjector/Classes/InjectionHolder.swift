//
//  InjectionHolder.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

/// Managed dependency container
public protocol InjectionHolder : class {
  /// Setup holder with fabric. The `fabric` closure will be called every time
  /// when `inject()` calls.
  /// - Paramenters: 
  ///   - fabric: The closure that fills dependecy container;
  func setFabric(_ fabric: @escaping (Container, Injector) -> Void)
  /// Clears all injection and calls `fabric` closure to fill dependecy container.
  func inject()
}



