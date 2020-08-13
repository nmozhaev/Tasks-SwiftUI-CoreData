//
//  ContentView.swift
//  Tasks
//
//  Created by Никита Можаев on 24.07.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import SwiftUI

import Domain

struct ContentView: View {
    
    init() {
        setTableViewAppearance()
        populateTasks()
    }
    
    var body: some View {
        TasksView(viewModel: TasksViewModel(tasksService: serviceProvider.makeTasksService()))
    }
    
    private func populateTasks() {
        let service = serviceProvider.makeTasksService()
        for i in 1...10 {
            let date = Date.random(daysBack: 2)
            let task = Task(title: "Task number \(i)", text: "Task number \(i)", date: date, isFinished: false)
            service.save(task) { _ in }
        }
    }
    
    private func setTableViewAppearance() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
