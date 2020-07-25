//
//  Webservices.swift
//  TarunMachineTest
//
//  Created by Tarun on 25/07/20.
//  Copyright © 2020 Tarun. All rights reserved.
//

import Foundation


//MARK:- Api communication method
//MARK:-
enum  HttpMethod:String {
    case get = "GET"
}


//MARK:- Enum for getting error in communication
//MARK:-
enum NetworkError:Error {
    case domainError
    case decodingError
    case urlError
}


class Webservices{
    
    func getCityInfoData(completion : @escaping(Result<CityDataModel, NetworkError>)->()){
        
        var encodableString: String? = nil
        let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let url = URL(string: urlString)
        
        do {
            
            if let url = URL(string: urlString) {
                encodableString = try String(contentsOf: url, encoding: String.Encoding(rawValue: String.Encoding.isoLatin1.rawValue))
            }
            
        } catch {
            
            print("Error in Server Communication")
        }
        
        var request = URLRequest(url: url!)
        request.httpBody = nil
        request.httpMethod = HttpMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ data , response, error in
            guard  let _  =  data , error == nil else{
                completion(.failure(.domainError))
                return
            }
            
            let response = encodableString?.data(using: .utf8)
            let result = try? JSONDecoder().decode(CityDataModel.self, from: response!)
            
            if let result = result{
                
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }else{
                
                completion(.failure(.decodingError))
            }
            
        }.resume()
        
    }
}
