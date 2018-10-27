//
//  FlickrImage.swift
//  Code-Challenge
//
//  Created by Kelsey Young on 10/26/18.
//  Copyright © 2018 Kelsey Young. All rights reserved.
//

import Foundation

struct FlickrImage: Decodable {
  let title: String
  let imageURLString: String
  let publishDate: Date

  private enum CodingKeys: String, CodingKey {
    case title = "title"
    case imageURL = "media"
    case publishDate = "published"
  }

  init(title: String, imageURLString: String, publishDate: Date) {
    self.title = title
    self.imageURLString = imageURLString
    self.publishDate = publishDate
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    var title: String? = try container.decodeIfPresent(String.self, forKey: .title)
    if (title == "" || title == nil) {title = "Flickr Photo"}

    let imageURLDict: [String: String] = try container.decodeIfPresent(Dictionary<String, String>.self, forKey: .imageURL) ?? ["m" : ""]

    let imageURLString: String = imageURLDict["m"] ?? ""

    let publishDateString: String = try container.decodeIfPresent(String.self, forKey: .publishDate) ?? ""
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd, yyyy"
    let publishDate: Date = formatter.date(from: publishDateString) ?? Date.init()
    self.init(title: title!, imageURLString: imageURLString, publishDate: publishDate)
  }

}
