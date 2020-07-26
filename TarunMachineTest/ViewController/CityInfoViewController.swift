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
    //MARK:-
    
    let cityInfoTableView = UITableView()
    
    private var cityListVM:CityInfoViewModel!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.darkGray
        
        return refreshControl
    }()
    
    
    //MARK:- View Controller life cycle method
    //MARK:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiComponentSetup()
    }
    
    //MARK:- Refresh control selector method
    //MARK:-
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        refreshControl.endRefreshing()
        self.apiCallForRetrieveCityInfo()
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
        self.cityInfoTableView.addSubview(self.refreshControl)
        
        self.apiCallForRetrieveCityInfo()
    }
}


//MARK:- UITableView Datasource and Delegate Method
//MARK:-
extension CityInfoViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.cityListVM == nil ? 0 : self.cityListVM.numbrOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cityListVM.numberOfRowsinSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CityInfoTableViewCell else{
            fatalError("Info Cell not found")
        }
        
        cell.configure(with: self.cityListVM.dataAtIndex(indexPath.row))
       
        return cell
    }
}


//MARK:- Webservices
//MARK:-
extension CityInfoViewController{
    
    func apiCallForRetrieveCityInfo(){
        
        if Reachability.sharedInstance.isConnectedToNetwork(){
            
            Webservices().getCityInfoData { [weak self] result in
                
                switch result{
                    
                case .success(let cityDataModel):
                    
                    print(cityDataModel.rows.count)
                    if let record = cityDataModel.rows{
                        
                        self?.cityListVM = CityInfoViewModel(row: record)
                        DispatchQueue.main.async {
                            self?.navigationItem.title = cityDataModel.title
                            self?.cityInfoTableView.reloadData()
                        }
                    }
                    
                case .failure(let error):
                    
                    let alertController = UIAlertController(title: "", message:error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                    self?.present(alertController, animated: true, completion: nil)
                }
                
            }
        }
        else{
            
            let alertController = UIAlertController(title: "", message: "Please check your internet connection", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in
                self.cityInfoTableView.reloadData()
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
}
