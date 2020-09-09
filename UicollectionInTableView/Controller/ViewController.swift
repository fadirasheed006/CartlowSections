//
//  ViewController.swift
//  UicollectionInTableView
//
//  Created by fahad rasheed on 29/08/2020.
//  Copyright © 2020 fahad rasheed. All rights reserved.
//

import UIKit
var itemApi = ItemApi()
var homeApi = HomeResponseApi()


var counter:Int = 0
class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeApi.getUrl { (homeData) in
            if let homeData = homeData {
                self.printCategory(catList: homeData.category!)
            }
        }

    
            
        }
    
    func printCategory(catList: [Category])
    {
        for cat in catList {
            print(cat)
        }
        
    }
    
    }




extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            fatalError("cell not created")}
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    
}

