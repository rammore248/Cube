//
//  TransferredTodayViewController.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 21/08/24.
//

import UIKit

class TransferListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    private var transferredFiles: [String] = [] // Replace with actual data model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FileCell")
        
        // Add subviews and set constraints (omitted for brevity)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transferredFiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell", for: indexPath)
        cell.textLabel?.text = transferredFiles[indexPath.row]
        return cell
    }
    
    // Implement cell actions (play, delete, resend) here
}
