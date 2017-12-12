//
//  InjectHolderTests.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import XCTest
@testable import SwiftInjector

final class InjectHolderTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    InjectHolder.setFabric { (container, injector) in
      container.addSingleton(SingletonComponent.self, factory: { SingletonComponentImpl() })
      container.add(Component.self, factory: { ComponentImpl() })
      container.add(Component1.self, factory: { Component1Impl() })
      container.add(Component1Impl.self, factory: { Component1Impl() })
    }
    InjectHolder.inject()
  }
  
  func testFabricInjection() {
    let component1 = Inject.get(Component.self)
    component1.value = "1"
    
    let component2 = Inject.get(Component.self)
    component2.value = "2"
    
    XCTAssertNotEqual(component1.value, component2.value, "Values of each components should be not equals")
    XCTAssert(component1 !== component2, "Objects should be not equals by reference")
  }
  
  func testSingletonInjection() {
    let component1 = Inject.get(SingletonComponent.self)
    component1.value = "1"
    
    let component2 = Inject.get(SingletonComponent.self)
    component2.value = "2"
    
    XCTAssertEqual(component1.value, component2.value, "Values of each components should be equals")
    XCTAssert(component1 === component2, "Objects should be equals by reference")
  }
  
  func testClassAndProtocolInjection() {
    let component1 = Inject.get(Component1Impl.self)
    component1.value = "1"
    
    let component2 = Inject.get(Component1.self)
    component2.value = "2"
    
    XCTAssertNotEqual(component1.value, component2.value, "Values of each components should be equals")
    XCTAssert(component1 !== component2, "Objects should be equals by reference")
  }
  
}
