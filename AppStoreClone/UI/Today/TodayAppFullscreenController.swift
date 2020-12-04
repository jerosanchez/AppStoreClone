//
//  AppFullscreenController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 3/12/20.
//

import UIKit

final class TodayAppFullscreenController: UITableViewController {
    
    var onDidTapCloseButton: () -> Void = { }

    private let header = TodayCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        header.enableCloseButton(onTap: #selector(handleDidTapCloseButton), target: self)
        return header
    }
    
    @objc private func handleDidTapCloseButton() {
        header.disableCloseButton()
        onDidTapCloseButton()
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodayAppFullscreenCell.cellId, for: indexPath) as! TodayAppFullscreenCell
        return cell
    }
    
    // MARK: - Helpers
    
    private func setup() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        registerCells()
    }

    private func registerCells() {
        tableView.register(TodayAppFullscreenCell.self, forCellReuseIdentifier: TodayAppFullscreenCell.cellId)
    }
}
