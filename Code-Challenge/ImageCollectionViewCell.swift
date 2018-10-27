//
//  ImageCollectionViewCell.swift
//  Code-Challenge
//
//  Created by Kelsey Young on 10/26/18.
//  Copyright © 2018 Kelsey Young. All rights reserved.
//

import UIKit
import SnapKit

class ImageCollectionViewCell: UICollectionViewCell {
  //Todo: Kelsey, place title, image, and publish date
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var publishLabel: UILabel!

  public func setupLabels(titleText: String, publishDate: Date) {
    title.text = titleText
    publishLabel.text = publishDate.description
  }

  public func loadImage(url: URL) {
    getData(from: url) { data, response, error in
      guard let data = data, error == nil else { return }
      DispatchQueue.main.async() {
        self.imageView.image = UIImage(data: data)
      }
    }
  }

  private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
  }
}
