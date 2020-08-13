//
//  Date+Ext.swift
//  Tasks
//
//  Created by Никита Можаев on 03.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

extension Date {
    
    var startOfDay: Date { Calendar.current.startOfDay(for: self) }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    var relativeDayName: String {
        if Calendar.current.isDateInTomorrow(self) {
            return "Tomorrow"
        }
        if Calendar.current.isDateInToday(self) {
            return "Today"
        }
        if Calendar.current.isDateInYesterday(self) {
            return "Yesterday"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    static func random(daysBack: Int) -> Date {
        
        let day = arc4random_uniform(UInt32(daysBack)) + 1
        let hour = arc4random_uniform(23)
        let minute = arc4random_uniform(59)
        
        var offsetComponents = DateComponents()
        offsetComponents.day = (Bool.random() ? 1 : -1) * Int(day - 1)
        offsetComponents.hour = -1 * Int(hour)
        offsetComponents.minute = -1 * Int(minute)
        
        return Calendar.current.date(byAdding: offsetComponents, to: Date())!
    }
    
}
