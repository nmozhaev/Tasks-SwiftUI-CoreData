//
//  TasksView.swift
//  Tasks
//
//  Created by Никита Можаев on 24.07.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import SwiftUI

import Domain

struct TasksView: View {
    
    @ObservedObject var viewModel: TasksViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            TasksHeader(selectedDay: self.viewModel.selectedDay,
                        onSelectDay: { weekDay in
                            self.viewModel.selectedDay = weekDay
            })
            List {
                ForEach(self.viewModel.dataSource, id: \.self) { item in
                    TaskRow(viewModel: item)
                    .onTapGesture {
                        self.viewModel.selectedTask = item
                    }
                    .listRowInsets(EdgeInsets(horizontal: 16.0))
                }
            }
            .id(UUID())
        }
        .onAppear {
            self.viewModel.fetchTasks()
        }
    }
    
}

struct TasksView_Previews: PreviewProvider {
    
    static let activeTask = Task(id: UUID(),
                                 title: "Meeting",
                                 text: "Discuss team tasks for the day",
                                 date: Date(),
                                 isFinished: false)
    
    static let task = Task(id: UUID(),
                           title: "Second Meeting",
                           text: "Discuss with team who will be fired",
                           date: Date(),
                           isFinished: false)
    
    static let task2 = Task(id: UUID(),
                            title: "Second Meeting",
                            text: "Discuss with team who will be fired",
                            date: Date(),
                            isFinished: false)
    
    static var previews: some View {
        TasksView(viewModel: TasksViewModel(tasksService: serviceProvider.makeTasksService()))
    }
}
