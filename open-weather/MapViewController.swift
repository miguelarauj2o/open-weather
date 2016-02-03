//
//  MapViewController.swift
//  open-weather
//
//  Created by Miguel Araújo on 2/1/16.
//  Copyright © 2016 Miguel Araújo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var map: MKMapView!
  var pin: MKPinAnnotationView!
  
  // region scope
  let regionRadius: CLLocationDistance = 1000000
  
  // set initial location in Condado :P
  let initialLocation: CLLocation = CLLocation(latitude: -7.5858, longitude: -35.1058)
  var locCoord: CLLocationCoordinate2D!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    alertUser()
    
    // ---------> LONG PRESS
    let lpgr = UILongPressGestureRecognizer(target: self, action: "handleLongPress:")
    lpgr.minimumPressDuration = 0.5
    lpgr.delaysTouchesBegan = true
    lpgr.delegate = self
    self.map.addGestureRecognizer(lpgr)
    
    // ---------> MAP SECTION
    centerMapOnLocation(initialLocation)
  }
  
  // alert user about app usage
  func alertUser() {
    let msg: String = "Para selecionar um ponto, basta um toque por mais de um segundo e depois soltar!"
    let alert = UIAlertController(title: "Aviso", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }
  
  @IBAction func search(sender: AnyObject) {
    print("button pressed")
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "mapToTable" {
      Container.cities = DataManager.requestAndParseData(CFloat(locCoord.latitude),
        lon: CFloat(locCoord.longitude))
    }
  }
}

// MARK - UIGestureRecognizerDelegate
extension MapViewController: UIGestureRecognizerDelegate {
  func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
    if gestureReconizer.state != UIGestureRecognizerState.Ended {
      return
    }
    
    map.removeAnnotations(self.map .annotations) // remove previous annotations
    let point: CGPoint = gestureReconizer.locationInView(self.map)
    self.locCoord = self.map.convertPoint(point, toCoordinateFromView: self.map)
    let dropPin = MKPointAnnotation()
    
    dropPin.coordinate = locCoord
    dropPin.title = "Ponto Escolhido"
    map.addAnnotation(dropPin)
  }
}

// MARK
extension MapViewController: CLLocationManagerDelegate {
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
      regionRadius * 2.0, regionRadius * 2.0)
    map.setRegion(coordinateRegion, animated: true)
  }
}