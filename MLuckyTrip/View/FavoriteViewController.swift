//
//  FavoriteViewController.swift
//  MLuckyTrip
//
//  Created by odc on 9/1/2023.
//

import UIKit

class FavoriteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var city : City?
    var n : Int?
    var cities : [City] = []
    
    //outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var placesOfIntrest: UILabel!
    // Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TVCell = tableView.dequeueReusableCell(withIdentifier: "CCell")!
        let cv = TVCell.contentView
        let name = cv.viewWithTag(1) as! UILabel
        let kind = cv.viewWithTag(2) as! UILabel
        let dist = cv.viewWithTag(3) as! UILabel
        //let fav = cv.viewWithTag(4) as! UIButton
        
        
        city = cities[indexPath.row]
        name.text = city?.name!
        kind.text = city?.kinds!
        let f = city?.dist!
        dist.text = String(format: "%.2f", f!)
        
        return TVCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)

        performSegue(withIdentifier: "favoriteDetail", sender: cell)
    }
    
    func fetchData() {
        
        CityViewModel().getPlacesByCoordination(apikey: "5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9", radius: 5000, lon: 10.63699, lat: 35.82539, format: "json"){
            [self] success, citiesList in
            if success{
                self.cities = citiesList!
                self.n = citiesList?.count
                placesOfIntrest.text = String(format: "Places of Intrest (%d)", n!)
                tableView.reloadData()
                
            }else{
                print("error")
            }
            
        }
        
       

        
    }
}
