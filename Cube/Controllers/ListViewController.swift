//
//  ListViewController.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 12/08/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Notification"
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}
