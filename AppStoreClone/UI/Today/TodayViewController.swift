//
//  TodayViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

class TodayViewController: UICollectionViewController {
    
    private var startingCellFrame: CGRect?

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

        let redView = UIView()
        redView.backgroundColor = .red
        redView.layer.cornerRadius = 16
        
        view.addSubview(redView)
        redView.frame = startingCellFrame ?? .zero

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(returnFromFullscreen))
        redView.addGestureRecognizer(tapGesture)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            redView.frame = self.view.frame
            
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height
            
        }, completion: nil)
    }
    
    @objc private func returnFromFullscreen(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            gesture.view?.frame = self.startingCellFrame ?? .zero
            
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height
            }
            
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
        })
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    
    private var leftRightPadding: CGFloat { return 32 }
    private var lineSpacing: CGFloat { return 32 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * leftRightPadding, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
