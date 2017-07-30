//
//  ComponentsSpecs.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

protocol Component: class {
  var value: String { get set }
}

final class ComponentImpl : Component {
  var value: String = ""
}

protocol SingletonComponent: class {
  var value: String { get set }
}

final class SingletonComponentImpl : SingletonComponent {
  var value: String = ""
}
