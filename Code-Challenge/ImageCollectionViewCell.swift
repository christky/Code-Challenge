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

  public func setupCell(titleText: String, imageURLString: String, publishDate: Date) {
    title.text = titleText
    //Todo: Kelsey, add image
    //imageView.image = UIImage(
    publishLabel.text = publishDate.description
  }
}
