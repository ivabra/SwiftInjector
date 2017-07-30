//
//  InjectionHolder.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

public protocol InjectionHolder : class {
  func setFabric(_ fabric: @escaping (Container, Injector) -> Void)
  func inject()
}



