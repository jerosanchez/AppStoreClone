//
//  AppFullscreenController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 3/12/20.
//

import UIKit

final class TodayAppFullscreenController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TodayCell()
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450
    }
}
