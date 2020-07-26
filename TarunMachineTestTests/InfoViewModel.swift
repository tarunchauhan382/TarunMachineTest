//
//  InfoViewModel.swift
//  TarunMachineTestTests
//
//  Created by Tarun on 26/07/20.
//  Copyright © 2020 Tarun. All rights reserved.
//

import XCTest
@testable import TarunMachineTest

class InfoViewModel: XCTestCase {

    private var cityListViewModel : CityInfoViewModel!
    
    override func setUp() {
        super.setUp()
        
        let dataArray = [DataModel(title: "DummyTitle", description: "DummyDescription", imageHref: "DummyURL"),DataModel(title: "DummyTitle1", description: "DummyDescription1", imageHref: "DummyURL1"),DataModel(title: "DummyTitle2", description: "DummyDescription2", imageHref: "DummyURL2"),DataModel(title: "DummyTitle3", description: "DummyDescription3", imageHref: "DummyURL3")]
        
        self.cityListViewModel = CityInfoViewModel(row: dataArray)
    }

    func test_numbrOfSection(){
        
        XCTAssertEqual(1, self.cityListViewModel.numbrOfSection)
        
    }
    
    func test_numberOfRowsinSection(){
        
        XCTAssertEqual(self.cityListViewModel.row.count, self.cityListViewModel.numberOfRowsinSection(self.cityListViewModel.numbrOfSection))
        
    }
    
    func test_dataAtIndex(){
          
          for (index,vm) in self.cityListViewModel.row.enumerated(){
              XCTAssertEqual(vm.description,self.cityListViewModel.dataAtIndex(index).description)
              XCTAssertEqual(vm.title,self.cityListViewModel.dataAtIndex(index).title)
              XCTAssertEqual(vm.imageHref,self.cityListViewModel.dataAtIndex(index).imageHref)
          }
          
    }
    
    override func tearDown() {
       
    }

}
