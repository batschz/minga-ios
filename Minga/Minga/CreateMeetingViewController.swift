//
//  CreateMeetingViewController.swift
//  Minga
//
//  Created by Carmen Probst on 08.06.17.
//  Copyright © 2017 MingaApp. All rights reserved.
//

import UIKit

class CreateMeetingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }


    @IBAction func save(_ sender: Any) {
        // save meeting
        dismiss(animated: true)
    }

}
