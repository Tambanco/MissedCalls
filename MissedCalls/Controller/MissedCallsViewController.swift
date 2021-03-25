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
                self.parseCallsList(rawCallsList: json)
            case .failure(let error):
                print(error)
                
            }
        }
    }
}

//MARK: - Update Hotels List
extension MissedCallsViewController
{
    func updateCallsList(jsonData: JSON)
    {
        if jsonData.exists()
        {
            let rawCallsList = jsonData[].arrayValue
            if rawCallsList.count > 0
            {
                parserCallsList(rawHotelsList: rawCallsList)
                
                DispatchQueue.main.async
                {
                    
                }
            }
            else
            {
                showAlert("No Data Available")
            }
        }
    }
}

// MARK: - Parsing JSON
extension MissedCallsViewController
{
    func parseCallsList(rawCallsList: JSON)
    {
        if rawCallsList.exists()
        {
            let rawCalls = rawCallsList[].arrayValue
            if rawCalls.count > 0
            {
                rawCalls.forEach( { downloadedCalls.append( DataFromRequest(id: $0["id"].string ?? "there is no id",
                                                                            state: $0["state"].string ?? "there is no state",
                                                                            clientName: $0["client"]["address"].string ?? "there is no address",
                                                                            clientPhoneNumber: $0["client"]["Name"].string ?? "there is no name",
                                                                            type: $0["type"].string ?? "there is no type",
                                                                            created: $0["created"].string ?? "there is no state",
                                                                            businessNumber: $0["businessNumber"]["number"].string ?? "there is no business number",
                                                                            businesLabel: $0["businessNumber"]["label"].string ?? "there is no business number",
                                                                            origin: $0["origin"].string ?? "there is no origin",
                                                                            favorite: $0["favorite"].bool ?? false,
                                                                            duration: $0["duration"].string ?? "there is no duration" ))
                })
                print(rawCalls)
            }
            
        }
        else
        {
            print("Failure to download")
        }
        
    }
}

