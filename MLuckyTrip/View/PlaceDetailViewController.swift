//
//  PlaceDetailViewController.swift
//  MLuckyTrip
//
//  Created by odc on 9/1/2023.
//

import UIKit

class PlaceDetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var location: UILabel!
    
    @IBAction func btn(_ sender: Any) {
    }
    
    @IBOutlet weak var kinds: UILabel!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetchdata()
        // Do any additional setup after loading the view.
    }
    /*
     func fetchdata(){
     CityViewModel.sharedInstance.getPlaceDetails(apikey: "5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9") { [self] success, city in
     if success {
     //let url = URL(String : city?.image)
     //image.loadImge(withUrl: url)
     
     name.text = city?.name
     kinds.text = city?.kinds
     location.text = city?.location
     text.text = city?.dist
     /*
      btn.addAction(UIAction(handler: { [self] act in
      var wikiUrl = city?.wikipedia
      
      
      }), for: .touchUpInside)*/
     }
     
     }
     }
     
     
     
     
     extension UIImageView {
     func loadImge(withUrl url: URL) {
     DispatchQueue.global().async { [weak self] in
     if let imageData = try? Data(contentsOf: url) {
     if let image = UIImage(data: imageData) {
     DispatchQueue.main.async {
     self?.image = image
     }
     }
     }
     }
     }
     }
     */
}
