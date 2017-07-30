//
//  InjectorTests.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import XCTest
@testable import SwiftInjector

final class InjectorTests: XCTestCase {
  
  var container: DefaultContainer!
  
  override func setUp() {
    super.setUp()
    container = DefaultContainer()
  }
  
  func testFabricInjection() {
    container.add(Component.self) { ComponentImpl() }
    let injector: Injector = container.makeInjector()
    let o1 = injector.get(Component.self)
    let o2 = injector.get(Component.self)
    o1.value = "1"
    o2.value = "2"
    XCTAssertNotEqual(o1.value, o2.value, "Values should be equals")
    XCTAssert(o1 !== o2, "Objects should be equals")
  }
  
  func testSingletoneInjection() {
    container.addSingleton(SingletonComponent.self, object: SingletonComponentImpl())
    let injector: Injector = container.makeInjector()
    let o1 = injector.get(SingletonComponent.self)
    let o2 = injector.get(SingletonComponent.self)
    o1.value = "1"
    o2.value = "2"
    XCTAssertEqual(o1.value, o2.value, "Values should be equals")
    XCTAssert(o1 === o2, "Objects should be equals")
  }
  
}
