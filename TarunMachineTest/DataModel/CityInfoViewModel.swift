//
//  CityInfoViewModel.swift
//  TarunMachineTest
//
//  Created by Tarun on 25/07/20.
//  Copyright © 2020 Tarun. All rights reserved.
//

import Foundation

struct CityInfoViewModel{
    
    let row:[DataModel]
}


//MARK: Datasource for Tableview

extension CityInfoViewModel{
    
    var numbrOfSection:Int{
        return 1
    }
    
    func numberOfRowsinSection(_ section:Int)->Int{
        return self.row.count
    }
    
    func dataAtIndex(_ index:Int)->DataViewModel{
        
        let record = self.row[index]
        return DataViewModel(record)
    }
    
}

//MARK:- Initialize Data View Model
//MARK:-
struct DataViewModel{
    
    private let Data:DataModel
    
    init(_ data:DataModel) {
        self.Data = data
    }
}

//MARK:- Initialize Data View Model properties
//MARK:-
extension DataViewModel{
    
    var title:String{
        return self.Data.title ?? "No title Found"
    }
    
    var description:String{
        return self.Data.description ?? "No Description Found"
    }
    
    var imageHref:String{
        return self.Data.imageHref ?? ""
    }
    
}
