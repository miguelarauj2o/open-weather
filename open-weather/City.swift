//
//  City.swift
//  open-weather
//
//  Created by Miguel Araújo on 2/2/16.
//  Copyright © 2016 Miguel Araújo. All rights reserved.
//

import Foundation
import CoreLocation

struct Container {
  static var cities = [City]()
  static var selectedRow: Int = 0
}

class City {
  let name: String
  let description: String
  let minimum: Float
  let maximum: Float
  
  init(name: String, description: String, min: Float, max: Float) {
    self.name = name
    self.description = description
    self.minimum = min
    self.maximum = max
  }
}
