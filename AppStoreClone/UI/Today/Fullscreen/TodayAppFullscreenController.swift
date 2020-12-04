//
//  AppFullscreenController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 3/12/20.
//

import UIKit

final class TodayAppFullscreenController: UITableViewController {
    
    var onDidTapCloseButton: () -> Void = { }

    private let item: TodayCellViewModel
    let header = TodayCell()

    init(item: TodayCellViewModel) {
        self.item = item
        
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        header.configure(with: item)
        header.enableCloseButton(onTap: #selector(handleDidTapCloseButton), target: self)
        return header
    }
    
    @objc private func handleDidTapCloseButton() {
        header.disableCloseButton()
        onDidTapCloseButton()
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 400
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
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        
        registerCells()
    }

    private func registerCells() {
        tableView.register(TodayAppFullscreenCell.self, forCellReuseIdentifier: TodayAppFullscreenCell.cellId)
    }
}
