//
//  RequestsService.swift
//  AppForMoya
//
//  Created by Raman Kozar on 09/04/2023.
//

import Foundation
import Moya

private let apiKey = "rtKAT2iKSyjSxpyQrTMJbqXblmlC1XrzAC5n8Bc5Xqtq55l4Kj79maeh_o3typf_ddzk_jQ67XG_vJHeCAyCM4Ews55zwJJS3v6FLZ1awz4Q1hkVQeqRjUnRCwYyZHYx"

enum YelpEnum {
    
    enum BusinessProvider: TargetType {
        
        case search(lat: Double, long: Double)
        
        var baseURL: URL {
            let url = URL(string: "https://api.yelp.com/v3/businesses")
            if let url = url {
                return url
            } else {
                return URL(string: "")!
            }
        }
        
        var path: String {
            
            switch self {
            case .search:
                return "/search"
            }
            
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Moya.Task {
            
            switch self {
            case let .search(lat, long):
                return .requestParameters(parameters: ["latitude": lat, "longitude": long, "limit": 1], encoding: URLEncoding.queryString)
            }
            
        }
        
        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
    
    }
    
}
