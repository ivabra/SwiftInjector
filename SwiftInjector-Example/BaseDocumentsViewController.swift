//
//  BaseDocumentsViewController.swift
//  SwiftInjector
//
//  Created by Ivan Brazhnikov on 31/07/2017.
//  Copyright © 2017 Ivan Brazhnikov. All rights reserved.
//

import UIKit

open class BaseDocumentsViewController: UITableViewController {
  
  var documentsManager: DocumentsManager {
    fatalError()
  }
  
  private var documents: [URL] = []
  
  // MARK: VC lifecycle
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    reloadDocuments()
  }
  
  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    reloadDocuments()
  }
  
  // MARK: User actions
  
  @IBAction private func reloadDocuments() {
    self.documents = documentsManager.allDocuments
    tableView.reloadData()
    tableView.refreshControl?.endRefreshing()
  }
  
  @IBAction private func addItem() {
    let name = "Document \(Int(Date().timeIntervalSinceReferenceDate * 1000)).txt"
    if let url = documentsManager.createDocument(name: name, contents: Data()) {
      tableView.beginUpdates()
      let ip = IndexPath(row: documents.count, section: 0)
      documents.append(url)
      tableView.insertRows(at: [ip], with: .automatic)
      tableView.endUpdates()
    }
  }
  
  private func deleteItem(at indexPath: IndexPath) {
    let document = documents[indexPath.row]
    tableView.beginUpdates()
    if documentsManager.removeDocument(at: document) {
      documents.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    tableView.endUpdates()
  }
  
  // MARK: TableView DataSource
  
  override open  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override open  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return documents.count
  }
  
  override open  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.setup(with: documents[indexPath.row])
    return cell
  }
  
  override open  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] _, indexPath in
      self?.deleteItem(at: indexPath)
    }
    return [deleteAction]
  }
}
