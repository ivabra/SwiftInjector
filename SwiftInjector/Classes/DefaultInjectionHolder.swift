//
//  DefaultInjectionHolder.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

final class DefaultInjectionHolder {
  
  var container: Container = DefaultContainer()
  var injector: Injector = DefaultInjector(registrar: DefaultTypeRegistrar())
  
  fileprivate var fabric: (Container, Injector) -> Void = { _,_ in }
}

extension DefaultInjectionHolder : InjectionHolder {
  
  public func setFabric(_ fabric: @escaping (Container, Injector) -> Void) {
    self.fabric = fabric
  }
  
  public func inject() {
    let container = DefaultContainer()
    let injector = container.makeInjector()
    fabric(container, injector)
    self.container = container
    self.injector = injector
  }
  
  func change(_ changeBlock: (Container) -> Void) {
    changeBlock(container)
  }

}
