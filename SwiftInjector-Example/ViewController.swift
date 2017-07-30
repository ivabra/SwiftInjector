//
//  ViewController.swift
//  SwiftInjector-Example
//
//  Created by Ivan Brazhnikov on 30/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import UIKit
import SwiftInjector

class ViewController: UITableViewController {

  private lazy var fileManager: MyFileManager = Inject.lazyGet(MyFileManager.self)()
  private var documents: [URL] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    reloadDocuments()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    reloadDocuments()
  }
  
  
  @IBAction func reloadDocuments() {
    self.documents = fileManager.allDocuments
    tableView.reloadData()
    tableView.refreshControl?.endRefreshing()
  }
  
  
  @IBAction func addItem() {
    let name = "Document \(Int(Date().timeIntervalSinceReferenceDate * 1000)).txt"
    if let url = fileManager.createDocument(name: name, contents: Data()) {
      tableView.beginUpdates()
      let ip = IndexPath(row: documents.count, section: 0)
      documents.append(url)
      tableView.insertRows(at: [ip], with: .automatic)
      tableView.endUpdates()
    }
  }
  
  func deleteItem(at indexPath: IndexPath) {
    let document = documents[indexPath.row]
    tableView.beginUpdates()
    if fileManager.removeDocument(at: document) {
      documents.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    tableView.endUpdates()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return documents.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.setup(with: documents[indexPath.row])
    return cell
  }
  
  override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] _, indexPath in
      self?.deleteItem(at: indexPath)
    }
    return [deleteAction]
  }
  

}


extension UITableViewCell {
  func setup(with documentURL: URL) {
    textLabel?.text = documentURL.deletingPathExtension().lastPathComponent
    detailTextLabel?.text = documentURL.pathExtension
  }
}

