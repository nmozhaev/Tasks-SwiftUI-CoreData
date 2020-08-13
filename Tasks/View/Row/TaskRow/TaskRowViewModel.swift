//
//  TaskRowViewModel.swift
//  Tasks
//
//  Created by Никита Можаев on 06.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation
import SwiftUI

import Domain

class TaskRowViewModel: ObservableObject, Identifiable {
    
    private let item: Task
    let isSelected: Bool
    let isLast: Bool
    
    var id: UUID { item.id }
    var title: String { item.title }
    var text: String { item.text }
    var isFinished: Bool { item.isFinished }
    var time: String { DateFormatter.time.string(from: item.date).uppercased() }
    
    var showCompleteButton: Bool {
        !isFinished && isSelected
    }
    
    var backgroundColor: Color { isSelected ? Color.primaryColor : Color.white }
    var pathLengthOffset: CGFloat { self.isSelected ? 30.0 : 45.0 }
    
    init(item: Task, isSelected: Bool, isLast: Bool) {
        self.item = item
        self.isSelected = isSelected
        self.isLast = isLast
    }
    
}

extension TaskRowViewModel: Hashable {
    
    static func == (lhs: TaskRowViewModel, rhs: TaskRowViewModel) -> Bool {
        lhs.item == rhs.item && lhs.isSelected == rhs.isSelected
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
}
