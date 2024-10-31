//
//  DepartmentSelectionViewController.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 21/08/24.
//

import UIKit

class DepartmentSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let departments = ["Cardiology", "Neurology", "Pediatrics"]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = departments[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDept = departments[indexPath.row]
        UserDefaults.standard.set(selectedDept, forKey: "selectedDepartment")
        // Navigate to Dashboard or other functionality
        let homeVC = DashboardViewController()
        navigationController?.pushViewController(homeVC, animated: true)
    }
}

