//
//  City.swift
//  MLuckyTrip
//
//  Created by odc on 9/1/2023.
//

import Foundation

struct City{
    
    internal init(xid: String? = nil, name: String? = nil, dist: Float? = nil, rate: Int? = 0, osm: String? = nil, wikidata: String? = nil, kinds: String? = nil, point: Point? = nil ){
            
        self.xid = xid
        self.name = name
        self.dist = dist
        self.kinds = kinds
        self.point = point
        self.wikidata = wikidata
        self.osm = osm
        self.rate = rate
       
            
        }
    internal init(name: String? = nil, dist: Float? = nil, kinds: String? = nil){
            
        self.name = name
        self.dist = dist
        self.kinds = kinds
            
        }
    
    var xid : String?
    var name : String?
    var dist : Float?
    var rate : Int?
    var osm : String?
    var wikidata : String?
    var kinds : String?
    var point : Point?
    var location : String?
    var image : String?
    var wiki  : String?
}

struct Point{
    
    internal init( lon : Float? = nil, lat : Float? = nil){
        self.lat = lat
        self.lon = lon
    }
    var lon : Float?
    var lat : Float?
}
