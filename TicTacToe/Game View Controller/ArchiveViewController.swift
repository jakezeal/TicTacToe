//
//  ArchiveViewController.swift
//  TicTacToe
//
//  Created by Jake on 10/29/16.
//  Copyright © 2016 Jake. All rights reserved.
//

import UIKit

class ArchiveViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

// MARK: - Table View Data Sourcefi
extension ArchiveViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: return number of past games played
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArchiveViewControllerConstants.tableViewCell.rawValue, for: indexPath)
        return cell
    }
}
