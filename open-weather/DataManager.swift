//
//  DataManager.swift
//  open-weather
//
//  Created by Miguel Araújo on 2/2/16.
//  Copyright © 2016 Miguel Araújo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class DataManager {
  class func requestAndParseData(lat: CFloat, lon: CFloat) -> [City] {
    let APIKEY: String = "28646f9df9a44602b15e9606097d7ce4"
    let base: String = "http://api.openweathermap.org/data/2.5/"
    let urlPath: String = "\(base)find?lat=\(lat)&lon=\(lon)&cnt=15&appid=\(APIKEY)"
    let url = NSURL(string: urlPath)
    
    var cities = [City]()
    
    Alamofire.request(.GET, url!).validate().responseJSON { response in
      switch response.result {
      case .Success:
        if let dataFromNetworking = response.result.value {
          let json = JSON(dataFromNetworking)
          for city in json["list"] {
            let city = City(name: city.1["name"].stringValue,
              description: city.1["weather"][0]["description"].stringValue,
              min: city.1["main"]["temp_min"].floatValue,
              max: city.1["main"]["temp_max"].floatValue)
            cities.append(city)
          }
          // reload table view
          Container.cities = cities
          NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        }
      case .Failure(let error):
        print(error)
      }
    }
    
    return cities
  }
}
