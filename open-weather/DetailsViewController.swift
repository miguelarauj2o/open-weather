//
//  DetailsViewController.swift
//  open-weather
//
//  Created by Miguel Araújo on 2/1/16.
//  Copyright © 2016 Miguel Araújo. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var min: UILabel!
  @IBOutlet weak var max: UILabel!
  @IBOutlet weak var desc: UILabel!
  
  var city: City!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.name.text = city.name
    self.min.text = "min: \(city.minimum)"
    self.max.text = "max: \(city.maximum)"
    self.desc.text = city.description
  }
}
