//
//  ViewController.swift
//  CollectionViewWithCardInsertCell
//
//  Created by Manas Mishra on 06/03/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let screenwidth: CGFloat = UIScreen.main.bounds.width
    let screenheight: CGFloat = UIScreen.main.bounds.height
    @IBOutlet weak var cardCollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        configure()
    }
    
    func configure() {
        let cellNib = UINib(nibName: "CardCollectionViewCell", bundle: nil)
        cardCollectionview.register(cellNib, forCellWithReuseIdentifier: "CardCollectionViewCell")
        cardCollectionview.delegate = self
        cardCollectionview.dataSource = self
        cardCollectionview.reloadData()
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardCollectionview.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        cell.containerView1.backgroundColor = .white
        cell.containerView2.alpha = 0
        cell.topContainerView2To1.constant = screenheight/4
        cell.heightContainerView2.constant = screenheight/4
        let timeDelay: Double = Double(indexPath.row)/50
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            print(timeDelay)
            cell.topContainerView2To1.constant = 0
            UIView.animate(withDuration: 0.3, delay: TimeInterval(timeDelay), options: UIView.AnimationOptions.curveEaseIn, animations: {
                cell.containerView2.alpha = 1
                cell.layoutIfNeeded()
            }, completion: nil)
            
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = screenwidth/3 - 10
        let height = screenheight/4
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let cellCard = cell as! CardCollectionViewCell
//        cellCard.topContainerView2To1.constant = 0
//        UIView.animate(withDuration: 0.3) {
//            cellCard.layoutIfNeeded()
//        }
    }
    
    
}

