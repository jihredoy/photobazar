//
//  catrgory.swift
//  photobazar
//
//  Created by eitysams on 2/23/20.
//  Copyright © 2020 eitysams. All rights reserved.
//

import Foundation
import FirebaseFirestore
struct catrgory {
    
    var name: String
    
    var id:  String
    var imUrl: String
    
    var isActive: Bool = true
    var timeStamp: Timestamp
}
