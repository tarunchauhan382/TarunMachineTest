//
//  CityInfoViewController.swift
//  TarunMachineTest
//
//  Created by Tarun on 25/07/20.
//  Copyright © 2020 Tarun. All rights reserved.
//

import UIKit

class CityInfoViewController: UIViewController {

    //MARK:- Variables
    
    let cityInfoTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Title"
        uiComponentSetup()
    }

}


//MARK:- UIComponents Setup
//MARK:-
extension CityInfoViewController{
    
    func uiComponentSetup(){
        
        view.backgroundColor = .white
        view.addSubview(cityInfoTableView)
        cityInfoTableView.translatesAutoresizingMaskIntoConstraints = false
        cityInfoTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        cityInfoTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        cityInfoTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        cityInfoTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        cityInfoTableView.dataSource = self
        cityInfoTableView.delegate = self
        cityInfoTableView.register(CityInfoTableViewCell.self, forCellReuseIdentifier: "Cell")
        cityInfoTableView.rowHeight = UITableView.automaticDimension
        cityInfoTableView.estimatedRowHeight = UITableView.automaticDimension
        cityInfoTableView.tableFooterView = UIView()
    }
}


//MARK:- UITableView Datasource and Delegate Method
//MARK:-
extension CityInfoViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CityInfoTableViewCell else{
            fatalError("Info Cell not found")
        }
        
        cell.titleHeadlineLabel.text = "Title Headline Dummy Text"
        cell.descriptionLabel.text = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters"
        
        cell.placeImage.image = UIImage(named: "imgPlaceholder")
        
        cell.selectionStyle = .none
        return cell
    }
}
