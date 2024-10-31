//
//  DashboardViewController.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 21/08/24.
//

import UIKit

class DashboardViewController: UIViewController {
    
    private let userNameLabel = UILabel()
    private let userSettingsButton = UIButton()
    private let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        userNameLabel.text = "Welcome, User"
        userSettingsButton.setTitle("User Settings", for: .normal)
        logoutButton.setTitle("Logout", for: .normal)
        
        userSettingsButton.addTarget(self, action: #selector(showUserSettings), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        
        // Add subviews and set constraints (omitted for brevity)
    }
    
    @objc private func showUserSettings() {
        let userSettingsVC = UserSettingsViewController()
        navigationController?.pushViewController(userSettingsVC, animated: true)
    }
    
    @objc private func logout() {
        // Handle logout (e.g., clear session, navigate to login screen)
    }
}
