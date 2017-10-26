import UIKit
import CoreLocation


/*
 A protocol defines what somethings delegate should be able to do. If a class conforms to a protocol, it
 must implement the required methods listed in teh procotol defination. Not the the body of the method is NOT
 written here, only the function signature. In this example in 'ViewController.swift' we say that it will conform to
 the 'SecondViewControllerDelegate' protocol, and therefor must implememtn the 'somethingChanged' method.
 */
protocol SecondViewControllerDelegate {
  func somethingChanged()
}

class SecondViewController: UIViewController {
  
  var location: CLLocation!
  
  /*This line says that the SecondViewController class can have a delegate that conforms to the
  'SecondViewControllerDelegate' protocol. This gets set up in the 'prepare(for segue: UIStoryboardSegue, sender: Any?)'
   method in 'ViewController.swift' at the same time we pass along the data to this view controller.
   */
  var delegate: SecondViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print(location)
    
  }
  
  
  @IBAction func back(_ sender: Any) {
    delegate?.somethingChanged()
    dismiss(animated: true, completion: nil)
  }
  
}
