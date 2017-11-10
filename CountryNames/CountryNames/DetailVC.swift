//
//  DetailVC.swift
//  CountryNames
//
//  Created by Gabriel Martinez on 2017-11-10.
//  Copyright © 2017 Gabriel Martinez. All rights reserved.
//

import UIKit

struct CountryNames : Decodable{
    let name : String
    //let nativeName : String
    let region : String
    let capital : String
//    let area : String
//    let languages : String
//    let translations :  String
//
    
}


class DetailVC: UIViewController {
    @IBOutlet weak var countryNameLabel: UILabel!
    
    var countries = [CountryNames]()
    
    var sentData1: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
     // Test
       
        let jsonURL = "https://restcountries.eu/rest/v2/all"
        let url = URL(string: jsonURL)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do{
                self.countries = try JSONDecoder().decode([CountryNames].self, from: data!)
                
                for eachCountry in self.countries{
                    print(eachCountry.name)
                    
                  
                }
            }
            catch{
                print("Error")
            }
            
            
            
            
            
        }.resume()
        
        self.navigationItem.title = sentData1
        // Do any additional setup after loading the view.
        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
