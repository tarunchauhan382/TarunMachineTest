//
//  TarunMachineTestTests.swift
//  TarunMachineTestTests
//
//  Created by Tarun on 25/07/20.
//  Copyright © 2020 Tarun. All rights reserved.
//

import XCTest
@testable import TarunMachineTest

class TarunMachineTestTests: XCTestCase {
    
    private var cityInfoVC : CityInfoViewController!
    
    override func setUp() {
        super.setUp()
        
        self.cityInfoVC = CityInfoViewController()
        let connectivity = Reachability.sharedInstance.isConnectedToNetwork()
        XCTAssertEqual(connectivity, true)
        
    }
    
    func test_apiCallForRetrieveCityInfo(){
        
        XCTAssertNotNil(self.cityInfoVC.apiCallForRetrieveCityInfo())
    }
    
    
    func test_uiComponentSetup(){
        
        XCTAssertNotNil(self.cityInfoVC.uiComponentSetup())
    }
    
    
    override func tearDown() {
        
    }
    
    
}
