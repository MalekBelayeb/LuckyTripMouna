//
//  CityViewModel.swift
//  MLuckyTrip
//
//  Created by odc on 9/1/2023.
//


import SwiftyJSON
import Alamofire

public class CityViewModel : ObservableObject{
    static let sharedInstance = CityViewModel()
    
    func makeItem(jsonItem: JSON) -> City {
        
        //array parsing
        var point = jsonItem["point"]
        var p = Point(
            lon: point["lon"].floatValue,
            lat: point["lat"].floatValue
            )
        return City(
            
            xid: jsonItem["xid"].stringValue,
            name: jsonItem["name"].stringValue,
            dist: jsonItem["dist"].floatValue,
            rate: jsonItem["rate"].intValue,
            osm: jsonItem["osm"].stringValue,
            wikidata: jsonItem["wikidata"].stringValue,
            kinds: jsonItem["kinds"].stringValue,
            point: p
            
            
        )
    }
    
    func getPlaceDEtails(apikey : String,
                                  completed: @escaping (Bool,City?)->Void){
        
        
        AF.request( "https://api.opentripmap.com/0.1/en/places/xid/W27922391",
                    method: .get,
                    parameters: [ "apikey": "5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9"],
                    encoding: URLEncoding(destination: .queryString)
                ).validate(statusCode: 200..<300)
                    .validate(contentType: ["application/json"])
                    .responseData { response in
                        switch response.result {
                        case .success:
                            var city = self.makeItem(jsonItem: JSON(response.data!))
                            completed(true, city)
                        case let .failure(error):
                            debugPrint(error)
                            completed(false, nil)
                        }
                    }
            
        }
    func getPlacesByCoordination(apikey : String,
                                  radius : Int,
                                  lon : Float,
                                  lat : Float,
                                 format : String,completed: @escaping (Bool,[City]?)->Void){
        
        
        AF.request( "https://api.opentripmap.com/0.1/en/places/radius",
                    method: .get,
                    parameters: [ "apikey": "5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9", "radius" : 5000 , "lon" : 10.63699, "lat" : 35.82539,"format" : "json" ],
                    encoding: URLEncoding(destination: .queryString)
                ).validate(statusCode: 200..<300)
                    .validate(contentType: ["application/json"])
                    .responseData { response in
                        switch response.result {
                        case .success:
                            var citiesList : [City]? = []
                            for singleJsonItem in JSON(response.data!) {
                                citiesList!.append(self.makeItem(jsonItem: singleJsonItem.1))
                            }
                            
                            completed(true, citiesList)
                        case let .failure(error):
                            debugPrint(error)
                            completed(false, nil)
                        }
                    }
            
        }
        
    }

