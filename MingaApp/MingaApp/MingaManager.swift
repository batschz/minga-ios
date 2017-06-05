//
//  MingaManager.swift
//  MingaApp
//
//  Created by Werner Huber on 04.06.17.
//  Copyright © 2017 MingaApp. All rights reserved.
//

import Foundation
import CloudKit

class MingaManager {

    static let shared = MingaManager()



    func currentUser() {
        let uuid = UUID().uuidString
        //let record = CKRecord(recordType: "People", recordID: CKRecordID(recordName: uuid))

        let database = CKContainer.default().publicCloudDatabase



        database.fetch(withRecordID: CKRecordID(recordName: uuid)) { (record, error) in


            if let error = error {
                print (error)
            }
            print (record)
        }
    }

}
