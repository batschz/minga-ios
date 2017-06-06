//
//  ViewController.swift
//  Minga
//
//  Created by Werner Huber on 05.06.17.
//  Copyright © 2017 MingaApp. All rights reserved.
//

import UIKit

class MeetingListController : UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customizeBarButtonItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizeBarButtonItems () {
        //var createMeeting = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: <#T##Selector?#>)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "meetingcell")
        return cell!
    }


}

