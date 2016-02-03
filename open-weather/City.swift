//
//  City.swift
//  open-weather
//
//  Created by Miguel Araújo on 2/1/16.
//  Copyright © 2016 Miguel Araújo. All rights reserved.
//

import Foundation

class City {
  let name: String
  let max: Float
  let min: Float
  let desc: String
  
  init(name: String, max: Float, min: Float, desc: String) {
    self.name = name
    self.max = max
    self.min = min
    self.desc = desc
  }
}