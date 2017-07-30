//
//  InjectTarget.swift
//  GoAboutApp
//
//  Created by Ivan Brazhnikov on 01.07.17.
//  Copyright © 2017 GoAbout. All rights reserved.
//

import Foundation

public protocol InjectTarget {
  var injector: Injector { get }
}

extension InjectTarget {
  public func inject<T>(_ type: T.Type) -> T {
    return injector.get(type)
  }
}

