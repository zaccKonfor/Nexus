//
//  MenuViewController.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/4/26.
//

import UIKit

class MenuViewController: UIViewController {

    weak var delegate: NexusViewDelegate?
    var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        tableViewConfiguration()
    }

//Mark:- setup tableview
    private func tableViewConfiguration() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let margins = self.view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: margins.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: margins.rightAnchor),
            tableView.topAnchor.constraint(equalTo: margins.topAnchor)
        ])
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as! CustomTableViewCell
        
        let menuOptions = Menu(rawValue: indexPath.row)
        cell.theLabel.text = menuOptions?.description
        cell.theImage.image = menuOptions?.image
        cell.theLabel.textColor = Components.standardGold
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
         
        let menuOptions = Menu(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOptions)
    }
}
