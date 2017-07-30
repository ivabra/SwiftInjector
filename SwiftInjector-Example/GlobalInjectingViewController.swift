//
//  GlobalInjectingViewController.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import Foundation

import UIKit
import SwiftInjector

final class GlobalInjectingViewController: BaseDocumentsViewController {
  
  override var documentsManager: DocumentsManager {
    return Inject.get(DocumentsManager.self)
  }
  
}
