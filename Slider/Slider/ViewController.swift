//
//  ViewController.swift
//  Slider
//
//  Created by Vijay on 06/02/21.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegateFlowLayout , UICollectionViewDelegate , UICollectionViewDataSource {
    
    @IBOutlet weak var pvcCurrentImageIndex: UIPageControl!
    var arraySliderImage = ["song01","song02","song03","song04","song05"]
    @IBOutlet weak var cvcImageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cvcImageCollection.dataSource = self
        cvcImageCollection.delegate = self
       // cvcImageCollection.isPagingEnabled = true
        pvcCurrentImageIndex.numberOfPages = arraySliderImage.count
        pvcCurrentImageIndex.currentPage = 0
   //     pvcCurrentImageIndex.addTarget(self, action: #selector(self.pageControlSelectionAction(_:)), for: .touchUpInside)
    }
    
//    @objc func pageControlSelectionAction(_ sender: UIPageControl) {
//           //move page to wanted page
//           let page: Int? = sender.currentPage
//        print("Current Index ====== ",sender.currentPage)
//          self.pageViewController?.setViewControllers([[orderedViewControllers[page!]]], direction: .forword, animated: true, completion: nil)
//       }
    
    override func viewDidAppear(_ animated: Bool) {
        pvcCurrentImageIndex.currentPage = 0
        cvcImageCollection.isPagingEnabled = false
        cvcImageCollection.scrollToItem(at: IndexPath(item: 0, section: 0), at: .right, animated: true)
        cvcImageCollection.isPagingEnabled = true
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraySliderImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCellCollectionViewCell", for: indexPath) as! imageCellCollectionViewCell
        cell.imgSliderImage.image = UIImage(named: arraySliderImage[indexPath.row])
       // print("SET INDEX PATH ROW \(indexPath.row)")
        return cell
    }
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//       // print("Will Display : Current Page \(pvcCurrentImageIndex.currentPage)")
//
//        print("Index Path ROW IN WILLDISPLAY: \(indexPath.row)")
//       // pvcCurrentImageIndex.currentPage = indexPath.row
//    }
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        for cell in cvcImageCollection.visibleCells {
//            let indexPath = cvcImageCollection.indexPath(for: cell)
//            print("Current Index ====== ",indexPath?.row)
//        }
//    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()

        visibleRect.origin = cvcImageCollection.contentOffset
        visibleRect.size = cvcImageCollection.bounds.size

        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

        guard let indexPath = cvcImageCollection.indexPathForItem(at: visiblePoint) else { return }
        pvcCurrentImageIndex.currentPage = indexPath.row
        
    }
    
    @IBAction func pageViewIndexChange(_ sender: UIPageControl) {
      //  print("PAGE VIEW INDEX CHANGE CURRENT PAGE :\(sender.currentPage)")
        cvcImageCollection.isPagingEnabled = false
        let rect = self.cvcImageCollection.layoutAttributesForItem(at: IndexPath(row: sender.currentPage, section: 0))?.frame
               self.cvcImageCollection.scrollRectToVisible(rect!, animated: true)
        pvcCurrentImageIndex.currentPage = sender.currentPage
        cvcImageCollection.isPagingEnabled = true
    }
    
}

