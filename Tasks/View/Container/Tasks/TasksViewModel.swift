//
//  TasksViewModel.swift
//  Tasks
//
//  Created by Никита Можаев on 06.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation
import Combine

import Domain
import CoreDataPlatform

class TasksViewModel: ObservableObject {
    
    @Published var selectedTask: TaskRowViewModel?
    @Published var selectedDay: Date = Date().startOfDay
    
    @Published var dataSource = [TaskRowViewModel]()
    
    private let tasksService: TasksService
    private let scheduler: DispatchQueue
    
    private var cancellables = Set<AnyCancellable>()
    
    init(tasksService: TasksService,
         scheduler: DispatchQueue = DispatchQueue(label: "TasksViewModel")) {
        self.tasksService = tasksService
        self.scheduler = scheduler
    }
    
    func fetchTasks() {
        
        let tasks = $selectedDay.setFailureType(to: Error.self).flatMap {
            self.tasksService.tasks(by: $0)
        }
    
        let selectedTask = $selectedTask.setFailureType(to: Error.self)
        
        Publishers.CombineLatest(tasks, selectedTask)
        .subscribe(on: scheduler)
        .compactMap { (tasks, selectedTask) in
            tasks.map { TaskRowViewModel(item: $0, isSelected: $0.id == selectedTask?.id, isLast: $0.id == tasks.last?.id) }
        }
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
            switch value {
            case .failure:
                self?.dataSource = []
            case .finished:
                break
            }
        }) { [weak self] viewModels in
            self?.dataSource = viewModels
            self?.preselectItem()
        }
        .store(in: &cancellables)
    }
    
    func preselectItem() {
        guard self.selectedTask == nil else { return }
        self.selectedTask = self.dataSource.first
    }
    
}
