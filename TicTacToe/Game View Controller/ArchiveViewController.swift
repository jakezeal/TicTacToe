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

extension ArchiveViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
