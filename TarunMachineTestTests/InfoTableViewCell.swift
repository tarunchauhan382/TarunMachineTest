//
//  InfoTableViewCell.swift
//  TarunMachineTestTests
//
//  Created by Tarun on 26/07/20.
//  Copyright © 2020 Tarun. All rights reserved.
//

import XCTest
@testable import TarunMachineTest

class InfoTableViewCell: XCTestCase {

    private var infoTableViewCell : CityInfoTableViewCell!
    
    override func setUp() {
        
        super.setUp()
        self.infoTableViewCell = CityInfoTableViewCell()
    }

    func test_configureWithData(){
        
         let data = DataModel(title: "DummyTitle", description: "DummyDescription", imageHref: "DummyURL")
         let dataViewModel = DataViewModel(data)
         XCTAssertNotNil(self.infoTableViewCell.configure(with: dataViewModel))
     }
    
    override func tearDown() {
       
    }

}
