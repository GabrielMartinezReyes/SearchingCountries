//
//  DetailVC.swift
//  CountryNames
//
//  Created by Gabriel Martinez on 2017-11-10.
//  Copyright © 2017 Gabriel Martinez. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var translateLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    
    
    
  
    
    var sentData1: String!
    var sentData2: String!
    var sentData3: String!
    var sentData4: String!
    var sentData5: String!
    var sentData6: String!
    
   
   

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let sentData2 = sentData2{
            countryNameLabel.text = sentData2
        }
        
        if let sentData3 = sentData3{
            
            nativeNameLabel.text = sentData3
        }
        
        if let sentData4 = sentData4{
            
            regionLabel.text = sentData4
        }
        if let sentData5 = sentData5{
            
            capitalLabel.text = sentData5
        }
        
        if let sentData6 = sentData6{
            flagImageView.image = UIImage(named: sentData6)
            
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
       
 
        
        self.navigationItem.title = sentData1
        // Do any additional setup after loading the view.
        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
