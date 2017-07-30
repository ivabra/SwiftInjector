//
//  MyFileManager.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

protocol MyFileManager {
  var allDocuments: [URL] { get }
  @discardableResult
  func removeDocument(at url: URL) -> Bool
  @discardableResult
  func createDocument(name: String, contents: Data) -> URL?
}

final class DefaultMyFileManager: MyFileManager {
  let fm = FileManager.default
  
  lazy var documentsDirectoryURL: URL = {
    self.fm.urls(for: .documentDirectory, in: .userDomainMask).first!
  }()
  
  var allDocuments: [URL] {
    do {
      return try fm.contentsOfDirectory(at: documentsDirectoryURL,
                                    includingPropertiesForKeys: nil,
                                    options: .skipsHiddenFiles)
    } catch {
      print("\(error)")
      return []
    }
  }
  
  @discardableResult
  func removeDocument(at url: URL) -> Bool {
    do {
      try fm.removeItem(at: url)
      return true
    } catch {
      print("\(error)")
      return false
    }
  }
  
  @discardableResult
  func createDocument(name: String, contents: Data) -> URL? {
    do {
      let url = documentsDirectoryURL.appendingPathComponent(name)
      try contents.write(to: url)
      return url
    } catch {
      print("\(error)")
      return nil
    }
  }
}
