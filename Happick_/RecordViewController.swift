////
////  RecordViewController.swift
////  Happick_
////
////  Created by chole on 2021/03/03.
////  Copyright © 2021 Claire. All rights reserved.
////
//
//import UIKit
//
//class RecordViewController: UIViewController {
//
//@IBOutlet weak var collectionView: UICollectionView
// var records(임의로) = record(임의로).fetchRecords()
// let cellScale: CGFloat = 0.6

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//let screenSize = UIScreen.main.bounds.size
//let cellWidth = floor(screenSize.witdh * cellScale)
//let cellHeight = floor(screenSize.height * cellScale)
//let insetX = (view.bounds.width - cellWidth) / 2.0
//let insetY = (view.bounds.height - cellHeight) / 2.0
//
//let layout = collectionView!.collectionViewLayout as!
//    UICollectionViewFlowLayout
//layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
//collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: indexY, right: insetX)

//        collectionView.dataSource = self
//        collectionView.delegate = self
            
//
//    }
//// Mark: - UICollectionViewDataSource
//
//    extension UICollectionViewController:
//        UICollectionViewDataSource
//{
//        func numberofSections (in collectionView: UIcollectionView) -> Int {
//            return 1
//        }
//
//        func collecionView(_ collectionView: UICollectionView, numberOfItemInSection section: Int) -> Int {
//            return (파일).count
//        }
//
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! UICollectionViewCell
//            let record(임의로 지음) = record(임의로 지음)
//
//            return cell
//        }
//    }
//
//  extension RecordViewController : UIScrollViewDelegate, UICollectionViewDelegate {
//    func scrollViewEndDragging(_ scrollView: UIScrollView, withVelocity celocity: velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let layout = self.collectionView?.conllectionViewLayout as!
//            UICollectionViewFlowlayout
//        let cellWidthIncludingSpacing = layout.itemSize.witdh + layout.minimumLineSpacing
//
//        var offset = targetContentOffset.pointee
//        let index = (offset.x + scrollView.contentInset.left)
//            cellWidthIncludingSpacing
//        let roundedIndex = round(index)
//
//        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
//
//        targetContentOffset.pointee = offset
//    }
//}



//}
