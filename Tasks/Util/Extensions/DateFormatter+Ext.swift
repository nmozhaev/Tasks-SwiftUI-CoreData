//
//  DateFormatter+Ext.swift
//  Tasks
//
//  Created by Никита Можаев on 02.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import UIKit

extension DateFormatter {
    
    static let dayWithNumber: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E\ndd"
        return dateFormatter
    }()
    
    static let fullDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter
    }()
    
    static let time: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        return dateFormatter
    }()
    
}
