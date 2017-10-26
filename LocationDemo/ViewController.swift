import UIKit
import CoreLocation

class ViewController: UIViewController {
  
  let locationManager = CLLocationManager()
  var userLocation: CLLocation?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    locationManager.requestAlwaysAuthorization()
    locationManager.delegate = self
    locationManager.startUpdatingLocation()
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "Next" { 
      let destinationViewController = segue.destination as! SecondViewController
      destinationViewController.delegate = self
      destinationViewController.location = userLocation
    }
    
  }

}



extension ViewController: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    guard let location = locations.last else { return }
    
    userLocation = location
    
  }
  
}


/*
 Here we are saying that the ViewController class conforms to the 'SecondViewControllerDelegate' protocol (written at the top of the
 'SecondViewController.swift' file). It's written in an extension to keep our code organised. It has to implment the methods defined
 in the protocol, in ths case, th somethingChanged() method.
 */
extension ViewController: SecondViewControllerDelegate {
  
  func somethingChanged() {
    print("something changed")
  }
  
}


// These are the keys you need to add to the info.plist to use the devices location.
// Privacy - Privacy - Location When In Use Usage Description
// Privacy - Privacy - Location Always and When In Use Usage Description
