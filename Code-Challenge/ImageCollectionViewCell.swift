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
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var publishLabel: UILabel!

  public func setupLabels(titleText: String, publishDate: Date) {
    title.text = titleText
    publishLabel.text = publishDate.description
  }

  public func styleLabels() {
    let font = UIFont(name: "Times New Roman", size: 10.0)
   publishLabel.font = font
    publishLabel.textColor = UIColor.blue
  }

  public func styleCell() {
    //This creates the shadows and modifies the cards a little bit
    contentView.layer.cornerRadius = 4.0
    contentView.layer.borderWidth = 1.0
    contentView.layer.borderColor = UIColor.clear.cgColor
    contentView.layer.masksToBounds = false
    contentView.backgroundColor = UIColor.white
    layer.shadowColor = UIColor.gray.cgColor
    layer.shadowOffset = CGSize(width: 0, height: 1.0)
    layer.shadowRadius = 4.0
    layer.shadowOpacity = 1.0
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    setupImageView()
  }

  public func setupImageView() {
    imageView.contentMode = .scaleAspectFit
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
