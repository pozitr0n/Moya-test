//
//  ViewController.swift
//  AppForMoya
//
//  Created by Raman Kozar on 09/04/2023.
//

import UIKit
import Moya

class ViewController: UIViewController {

    let location = LocationService()
    
    let requester = MoyaProvider<YelpEnum.BusinessProvider>()

    override func viewDidLoad() {
        super.viewDidLoad()
        requestAPI()
    }

    func requestAPI() {
        
        requester.request(.search(lat: 52.407168000138164, long: 16.91983617301819)) { result in
            
            switch result {
            case .success(let response):
            
                let result = try? JSONSerialization.jsonObject(with: response.data, options: [])
                if let result = result {
                    print(result)
                } else {
                    print("Nothing")
                }
                
            case .failure(let error):
                
                print("Error \(error)")
                
            }
            
        }
        
    }

}

