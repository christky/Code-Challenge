//
//  ViewController.swift
//  Code-Challenge
//
//  Created by Kelsey Young on 10/26/18.
//  Copyright © 2018 Kelsey Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {

  @IBOutlet weak var imageCollectionView: UICollectionView!
  @IBOutlet weak var searchBar: UISearchBar!
  override func viewDidLoad() {
    setupSearchBar()
    super.viewDidLoad()
  }

  private func setupSearchBar() {

  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return APIService.instance.imageData.count //Todo: Update
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
    cell.setupLabels(titleText: APIService.instance.imageData[indexPath.row].title, publishDate: APIService.instance.imageData[indexPath.row].publishDate)
    if let url = URL(string: APIService.instance.imageData[indexPath.row].imageURLString) {
        cell.imageView.contentMode = .scaleAspectFit
        cell.loadImage(url: url)
    }
    return cell
  }

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let text = searchBar.text, text != "" else {return}
    APIService.instance.fetchImages(text: text) { [unowned self] success in
      if success {
//        print("Kelsey: imageData contains \(APIService.instance.imageData.description)")
        self.imageCollectionView.reloadData()
      } else {
        let alert = UIAlertController(title: "Sorry", message: "There was an error with the search. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
      }
    }
  }
}

