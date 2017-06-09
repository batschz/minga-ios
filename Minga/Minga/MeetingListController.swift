//
//  ViewController.swift
//  Minga
//
//  Created by Werner Huber on 05.06.17.
//  Copyright © 2017 MingaApp. All rights reserved.
//

import UIKit

class MeetingListController : UITableViewController, UISearchResultsUpdating {

    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customizeBarButtonItems()
        setupSearchController()
    }

    func setupSearchController() {
        searchController.searchResultsUpdater = self
    }

    func updateSearchResults(for searchController: UISearchController) {
        // update
    }
    
    func customizeBarButtonItems () {
        navigationItem.searchController = searchController
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "meetingcell")
        return cell!
    }

}

