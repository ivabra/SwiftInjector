//
//  UITableViewCell+Utils.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import UIKit

extension UITableViewCell {
  func setup(with documentURL: URL) {
    textLabel?.text = documentURL.deletingPathExtension().lastPathComponent
    detailTextLabel?.text = documentURL.pathExtension
  }
}
