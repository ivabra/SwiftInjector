//
//  Synchronization.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 22/11/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation
import Dispatch

extension DispatchQueue {
  static var currentLabel: String {
    return String(cString: __dispatch_queue_get_label(nil))
  }
  var isCurrent: Bool {
    return label == DispatchQueue.currentLabel
  }
}
