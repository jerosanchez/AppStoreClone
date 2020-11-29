//
//  AppDetailsViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

final class AppDetailsViewController: UIViewController {
    
    private let appId: String
    private let appDetailsService = AppDetailsService()
    
    init(appId: String) {
        self.appId = appId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        view.backgroundColor = .white
        print("App id: \(appId)")
    }
    
    // MARK: - Helpers
    
    private func fetchData() {
        appDetailsService.load(appId: appId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(appDetails):
                print(appDetails)
                
            case let .failure(error):
                print("Load failed: \(error)")
            }
        }
    }
}
