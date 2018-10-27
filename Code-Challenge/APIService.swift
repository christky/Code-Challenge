//
//  APIService.swift
//  Code-Challenge
//
//  Created by Kelsey Young on 9/28/18.
//  Copyright © 2018 Kelsey Young. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService {
  static let instance = APIService()

  enum EndpointType: String {
    case fetchImagesURL
  }

  var imageData : [FlickrImage] = []
  public func fetchImages(text: String, completion: @escaping (Bool) -> Void) {
    let route = buildURLString(text: text, endpointType: .fetchImagesURL)
    Alamofire.request(route, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).validate().responseString { (response) in
      switch response.result {
      case .success(let value):
        completion(self.setupDataSource(dataString: value))
      case .failure:
        completion(false)
      }
    }
  }

  //Returns whether or not the data was successfully parsed.
  private func setupDataSource(dataString: String) -> Bool {
    do {
//      print("Kelsey: dataString is \(dataString)")
      //To bypass the jsonFlickrFeed( prefix
      let startOfJSONIndex = dataString.index(dataString.startIndex, offsetBy: 15)
      //To bypass the ) suffix
      let endOfJSONIndex = dataString.index(dataString.endIndex, offsetBy: -1)
      let strippedString = dataString[startOfJSONIndex..<endOfJSONIndex]
      let jsonData: Data! = strippedString.data(using: .utf8)
      let json = try JSON(data: jsonData)["items"]
      self.imageData = try JSONDecoder().decode([FlickrImage].self, from: json.rawData())
      return true
    } catch let error {
      print("Kelsey: The error is \(error)")
      return false
    }
  }

  private func buildURLString(text: String, endpointType: EndpointType ) -> String {
    var result = ""
    if endpointType == .fetchImagesURL {
      result += "\(fetchImagesURL)?format=json"
    }
    return result
  }
}
