//
//  CityDataModel.swift
//  TarunMachineTest
//
//  Created by Tarun on 25/07/20.
//  Copyright © 2020 Tarun. All rights reserved.
//

import Foundation
import UIKit


struct CityDataModel:Decodable{
    
    let title: String
    let rows: [DataModel]!
}


struct DataModel:Decodable {
    
    let title:String?
    let description:String?
    let imageHref:String?
    
}
