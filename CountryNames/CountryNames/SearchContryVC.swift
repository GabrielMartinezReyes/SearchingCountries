//
//  ViewController.swift
//  CountryNames
//
//  Created by Gabriel Martinez on 2017-11-10.
//  Copyright © 2017 Gabriel Martinez. All rights reserved.
//

import UIKit

class SearchContryVC: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    
    
    @IBOutlet weak var countryTableView: UITableView!
    
    var fetchedCountry = [Country]()
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseData()
        searchBar()
        countryTableView.dataSource = self
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    func searchBar(){
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        searchBar.delegate = self
        self.countryTableView.tableHeaderView = searchBar
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            parseData()
        }else{
            
            fetchedCountry = fetchedCountry.filter({ (country) -> Bool in
                
                return country.country.lowercased().contains(searchText.lowercased())
            })
        }
        self.countryTableView.reloadData()
    }
    
    
    
    override var prefersStatusBarHidden: Bool{
        
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryTableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = fetchedCountry[indexPath.row].country
        return cell!
    }

   
    func parseData(){
        fetchedCountry = []
        let url = "https://restcountries.eu/rest/v2/all"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            
            if error != nil {
                print("Error")
            }else{
                
                do{
                    
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
//                    print(fetchedData)
                    for eachFetchedCountry in fetchedData{
                        let eachCountry = eachFetchedCountry as! [String : Any]
                        let country = eachCountry["name"] as! String
                        let nativeName = eachCountry["nativeName"] as! String
                        let regionName = eachCountry["region"] as! String
                        let capitalName = eachCountry["capital"] as! String
                        let flagImage = eachCountry["flag"] as! String
                        
                       
                      
                       
                      
                       
                        
                        self.fetchedCountry.append(Country(country: country, nativeName: nativeName, region: regionName, capital: capitalName, flag: flagImage))
                        
                    }

                self.countryTableView.reloadData()
                }catch{
                    print("Error 2")
                }
                
            }
            
        }
        task.resume()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "DetailVC" ){
            
            
            let detailVC = segue.destination as! DetailVC
            if let indexPath = self.countryTableView.indexPathForSelectedRow{
                
               
               
                detailVC.sentData1 = fetchedCountry[indexPath.row].country
                detailVC.sentData2 = fetchedCountry[indexPath.row].country
                detailVC.sentData3 = fetchedCountry[indexPath.row].nativeName
                detailVC.sentData4 = fetchedCountry[indexPath.row].region
                detailVC.sentData5 = fetchedCountry[indexPath.row].capital
                detailVC.sentData6 = fetchedCountry[indexPath.row].flag
                
                
                
            }
            
            
        }
        
        
        
    }
    
}

class Country{
    
    var country: String
    var nativeName: String
    var region: String
    var capital: String
    var flag: String
    
    
    
    init(country: String, nativeName: String, region: String, capital: String, flag:String) {
       
        self.country = country
        self.nativeName = nativeName
        self.region = region
        self.capital = capital
        self.flag = flag
        
       
    }
}

