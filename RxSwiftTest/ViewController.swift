//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by Chris Slowik on 3/22/16.
//  Copyright © 2016 Chris Slowik. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK:- Properties
    // Views
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Data
    var shownCities = [String]()
    let allCities = ["New York", "Chicago", "Boston", "Los Angeles", "Sacramento", "Cleveland"]
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar
            .rx_text
            .throttle(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { $0.characters.count > 0 }
            .subscribeNext { [unowned self] (query) in
                self.shownCities = self.allCities.filter {$0.hasPrefix(query) }
                self.tableView.reloadData()
            }
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cityPrototypeCell", forIndexPath: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
        
        return cell
    }
}

