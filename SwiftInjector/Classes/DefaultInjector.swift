//
//  DefaultInjector.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 29/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

public final class DefaultInjector : Injector {
  
  let registrar: TypeRegistrar
  
  init(registrar: TypeRegistrar) {
    self.registrar = registrar
  }
  
  public func get<T>(_ type: T.Type, args: [Any]) -> T {
    do {
      return try registrar.resolve(type, args: args)
    } catch {
      fatalError("Failed dependency resolving of type \(type)! with arguments \(args)! \(error)")
    }
  }
  
  public func opt<T>(_ type: T.Type, args: [Any]) -> T? {
    do {
      return try registrar.resolve(type, args: args)
    } catch {
      NSLog("Error when resolving dependency \(type), %@", error as NSError)
      return nil
    }
  }
  
}
