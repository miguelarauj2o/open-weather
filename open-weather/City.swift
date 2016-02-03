//
//  City.swift
//  open-weather
//
//  Created by Miguel Araújo on 2/2/16.
//  Copyright © 2016 Miguel Araújo. All rights reserved.
//

import Foundation
import CoreLocation

class City {
  let name: String
  let description: String
  let minimum: CFloat
  let maximum: CFloat
  
  init(name: String, description: String, min: CFloat, max: CFloat) {
    self.name = name
    self.description = description
    self.minimum = min
    self.maximum = max
  }
}
