//
//  MeetingCell.swift
//  Minga
//
//  Created by Manu Rink on 05.06.17.
//  Copyright © 2017 MingaApp. All rights reserved.
//

import Foundation
import UIKit

class MeetingCell : UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var meetingTitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var meetingOwnerLabel: UILabel!
    @IBOutlet var reviewSumLabel: UILabel!


    override func awakeFromNib() {
        
    }
}
