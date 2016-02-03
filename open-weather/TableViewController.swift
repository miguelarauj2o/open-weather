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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList:",name:"load", object: nil)
  }
  
  // Helper function that allows to reload this table view
  // from another controller (DataManager)
  func loadList(notification: NSNotification) {
    self.tableView.reloadData()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "tableToDetails" {
      let details = segue.destinationViewController as! DetailsViewController
      Container.cities[Container.selectedRow].name
      details.city = Container.cities[Container.selectedRow]
    }
  }
}

// MARK - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Container.cities.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
    cell.city.text = Container.cities[indexPath.row].name
    return cell
  }
}

// MARK - UITableViewDelegate
extension TableViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    print("didSelectRowAtIndexPath")
    Container.selectedRow = indexPath.row
  }
}