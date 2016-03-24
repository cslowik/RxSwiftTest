//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by Chris Slowik on 3/22/16.
//  Copyright © 2016 Chris Slowik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK:- Properties
    // Views
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Data
    var shownCities = [String]()
    let allCities = ["New York", "Chicago", "Boston", "Los Angeles", "Sacramento", "Cleveland"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

