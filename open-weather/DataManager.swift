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
          
          for _ in json {
            let city = City(name: json["list"][0]["name"].string!,
              description: json["list"][0]["weather"][0]["description"].string!,
              min: json["list"][0]["main"]["temp_min"].float! - 273.15,
              max: json["list"][0]["main"]["temp_max"].float! - 273.15)
            cities.append(city)
          }
        }
      case .Failure(let error):
        print(error)
      }
    }
    
    return cities
  }
}
