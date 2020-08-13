//
//  TasksService+Combine.swift
//  Tasks
//
//  Created by Никита Можаев on 07.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation
import Combine

import Domain

extension TasksService {
    
    func tasks(by date: Date) -> Future<[Task], Error> {
        return Future { promise in
            self.tasks(by: date) { promise($0) }
        }
    }
    
    func save(_ task: Task) -> Future<Void, Error> {
        return Future { promise in
            self.save(task) { promise($0) }
        }
    }
    
}
