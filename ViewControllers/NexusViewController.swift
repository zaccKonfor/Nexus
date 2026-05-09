//
//  NexusViewController.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/4/26.
//

import UIKit
import AVFoundation

class NexusViewController: UIViewController {

    weak var delegate: NexusViewDelegate?
    private var collectionView: UICollectionView?
    public var data = [VideoModel]()
    public static var index: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        data = VideoData.videoDataModel
        showCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showNavBar()
    }
    
    //Mark: - Selectors
    @objc func toggleHandler() {
        delegate?.handleMenuToggle(forMenuOption: nil)
        }
    
    @objc func didTapReload() {
        print("Reload page")
    }
    
    //Set NavBar
    private func showNavBar() {
            let nav = navigationController?.navigationBar
            let navItem = navigationItem
                navItem.title = "Welcome @Minato_Namikaze"
        nav?.backgroundColor = .clear
        nav?.tintColor = Components.standardGold
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:Components.standardGold]
        nav?.barStyle = .default

            let reloadPageButton = UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise"),  style: .plain, target: self, action:#selector(didTapReload))
            let menuButton = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(toggleHandler))
        
                 navItem.rightBarButtonItems = [reloadPageButton]
                 navItem.leftBarButtonItems = [menuButton]
        
              }
    
    //set collectionView frame
    private func configureUI() {
        collectionView?.frame = view.bounds
    }
    
    //Set collectionView
    private func showCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width,
                                 height: view.frame.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.register(CustomVideoCollectionViewCell.self, forCellWithReuseIdentifier: CustomVideoCollectionViewCell.identifier)
        collectionView?.isPagingEnabled = true
        collectionView?.dataSource = self
        view.addSubview(collectionView ?? UICollectionView())
        view.sendSubviewToBack(collectionView ?? UICollectionView())
    }
}

extension NexusViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomVideoCollectionViewCell.identifier, for: indexPath) as! CustomVideoCollectionViewCell
       
        cell.configure(with: model)
        
        cell.updateLikeButtonState(isSelected: model.isSelected)
        
        let isLiked = LikeManager.shared.getLikedIDs().contains(model.videoFileName)
        let newColor = isLiked ? UIColor.red : UIColor.white
        cell.likeButton.tintColor = newColor
        
            cell.onButtonTap = { [weak self] in
                
                self?.data[indexPath.item].isSelected.toggle()
                
                //update the like status
                let currentStatus = LikeManager.shared.getLikedIDs().contains(model.videoFileName)
                
                //retrieve status from the like manager class
                LikeManager.shared.setLiked(id: model.videoFileName, isLiked: !currentStatus)
                print("Data updated for index \(indexPath.item)")
                
            }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let videoCell = cell as? CustomVideoCollectionViewCell {
            videoCell.playVideo()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let videoCell = cell as? CustomVideoCollectionViewCell {
            videoCell.pauseVideo()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Find cells that are fully within the collection view's bounds
        guard let collectionViewFlow = collectionView else {return}
        let visibleCells = collectionViewFlow.visibleCells.compactMap { $0 as? CustomVideoCollectionViewCell }
        
        for cell in visibleCells {
            let cellRect = collectionViewFlow.convert(cell.frame, to: collectionViewFlow.superview)
            
            // If the center of the cell is within the visible area
            if collectionViewFlow.frame.contains(CGPoint(x: cellRect.midX, y: cellRect.midY)) {
                cell.playVideo()
            } else {
                cell.pauseVideo()
            }
        }
    }
}
