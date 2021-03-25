//
//  ViewController.swift
//  MissedCalls
//
//  Created by tambanco 🥳 on 23.03.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class MissedCallsViewController: UIViewController
{
// MARK: - Outlets
    let urlAdress                               = "https://5e3c202ef2cb300014391b5a.mockapi.io/testapi"
    var downloadedCalls: [DataFromRequest]      = []
        


    override func viewDidLoad()
    {
        super.viewDidLoad()
        makeRequest(url: urlAdress)
    }


}

//MARK: - Networking
extension MissedCallsViewController
{
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
}

// MARK: - Parsing JSON
extension MissedCallsViewController
{
    func parseCallsList(rawCallsList: [JSON])
    {
        rawCallsList.forEach( { downloadedCalls.append( DataFromRequest(id: $0["id"].string ?? "there is no id",
                                                                    state: $0["state"].string ?? "there is no state",
                                                                    client: $0["client"].dictionaryValue ?? ["Key" : "Value"],
                                                                    type: <#T##String#>,
                                                                    created: <#T##String#>,
                                                                    businessNumber: <#T##Dictionary<String, String>#>,
                                                                    origin: <#T##String#>,
                                                                    favorite: <#T##Bool#>,
                                                                    duration: <#T##String#> ))
        })
    }
}

