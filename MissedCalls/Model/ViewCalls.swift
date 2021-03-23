//
//  ViewCalls.swift
//  MissedCalls
//
//  Created by tambanco 🥳 on 23.03.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

struct dataFromRequest
{
    let id: String
    let state: String
    let client: Dictionary<String, String>
    let type: String
    let created: String
    let businessNumber: Dictionary<String, String>
    let origin: String
    let favorite: Bool
    let duration: String
}

// MARK: - Outlets
    let urlAdress = "https://5e3c202ef2cb300014391b5a.mockapi.io/testapi"
    

//MARK: - Networking
func makeRequest(url: String)
{
    AF.request(url).responseJSON { response in
        switch response.result
        {
        case .success(let value):
            let json = JSON(value)
            print(json)
        case .failure(let error):
            print(error)
            
        }
    }
}
