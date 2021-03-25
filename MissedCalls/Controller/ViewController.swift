//
//  ViewController.swift
//  MissedCalls
//
//  Created by tambanco 🥳 on 23.03.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController
{
// MARK: - Outlets
    let urlAdress = "https://5e3c202ef2cb300014391b5a.mockapi.io/testapi"
        


    override func viewDidLoad()
    {
        super.viewDidLoad()
        makeRequest(url: urlAdress)
    }


}

//MARK: - Networking
extension ViewController
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


