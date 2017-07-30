//
//  ViewController.swift
//  SwiftInjector-Example
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import UIKit
import SwiftInjector

final class LocalInjectingViewController: BaseDocumentsViewController {
  override var documentsManager: DocumentsManager {
    return inject(DocumentsManager.self)
  }
}
/// If you want to have different containers for different classes
/// then you can use class-local injecting via expension
extension LocalInjectingViewController : DefaultInjectTarget {}

