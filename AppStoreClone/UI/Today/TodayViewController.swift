//
//  TodayViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

class TodayViewController: UICollectionViewController {
    
    private var startingCellFrame: CGRect?
    
    private var topConstraint: NSLayoutConstraint?
    private var leadingConstraint: NSLayoutConstraint?
    private var widthConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?

    private var appFullscreenController: TodayAppFullscreenController!

    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.cellId, for: indexPath) as! TodayCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath), let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }

        goToFullscreen(fromFrame: startingFrame)
    }
    
    // MARK: - Helpers
    
    private func setup() {
        collectionView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        navigationController?.isNavigationBarHidden = true

        registerCells()
    }
    
    private func registerCells() {
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.cellId)
    }
    
    private func goToFullscreen(fromFrame startingFrame: CGRect) {
        self.startingCellFrame = startingFrame
        
        appFullscreenController = TodayAppFullscreenController(style: .grouped)
        addChild(appFullscreenController)
        
        appFullscreenController.onDidTapCloseButton = returnFromFullscreen
        
        let fullscreenView = appFullscreenController.view!
        fullscreenView.layer.cornerRadius = 16

        fullscreenView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = fullscreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullscreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = fullscreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullscreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        view.addSubview(fullscreenView)

        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach { $0?.isActive = true }
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }

            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded() // starts animation
            
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height

        }, completion: nil)
    }
    
    private func returnFromFullscreen() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self, let startingCellFrame = self.startingCellFrame else { return }
            
            self.appFullscreenController.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            
            self.topConstraint?.constant = startingCellFrame.origin.y
            self.leadingConstraint?.constant = startingCellFrame.origin.x
            self.widthConstraint?.constant = startingCellFrame.width
            self.heightConstraint?.constant = startingCellFrame.height
            
            self.view.layoutIfNeeded()
            
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height
            }
            
        }, completion: { [weak self] _ in
            guard let self = self else { return }
            
            self.appFullscreenController.view?.removeFromSuperview()
            self.appFullscreenController.removeFromParent()
        })
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    
    private var leftRightPadding: CGFloat { return 32 }
    private var lineSpacing: CGFloat { return 32 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * leftRightPadding, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
