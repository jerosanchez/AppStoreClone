//
//  AppDetailsViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

final class AppDetailsViewController: UIViewController {
    
    var appId: String? {
        didSet {
            guard let appId = appId else { return }
            fetchData(for: appId)
        }
    }
    
    private let appDetailsService = AppDetailsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    // MARK: - Helpers
    
    private func fetchData(for appId: String) {
        appDetailsService.load(appId: appId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(appDetails):
                DispatchQueue.main.async {
                    self.navigationItem.title = appDetails.trackName
                }
                
            case let .failure(error):
                print("Load failed: \(error)")
            }
        }
    }
}
