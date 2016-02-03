//
//  TableViewController.swift
//  open-weather
//
//  Created by Miguel Araújo on 2/1/16.
//  Copyright © 2016 Miguel Araújo. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  var cities = [City]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList:",name:"load", object: nil)
  }
  
  func loadList(notification: NSNotification) {
    self.tableView.reloadData()
  }
  
  // MARK - UITableViewDataSource
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cities.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
    cell.city.text = cities[indexPath.row].name
    print(cities[indexPath.row].name)
    return cell
  }
}
