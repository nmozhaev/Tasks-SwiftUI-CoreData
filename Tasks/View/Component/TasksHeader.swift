//
//  TasksHeader.swift
//  Tasks
//
//  Created by Никита Можаев on 24.07.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import SwiftUI

struct TasksHeader: View {
    
    // MARK: - Properties
    
    private var weekDays: [Date] {
        (-3...4).compactMap { Calendar.current.date(byAdding: .day, value: $0, to: Date().startOfDay) }
    }
    
    var selectedDay: Date
    
    var onSelectDay: ((Date) -> Void)?
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(DateFormatter.fullDate.string(from: self.selectedDay))
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Text(self.selectedDay.relativeDayName)
                        .font(.title)
                        .bold()
                }
                Spacer()
                Button(action: {
                    // TODO: Navigation to AddTask screen
                }) {
                    Text("+ Add task")
                        .padding(.horizontal, 12.0)
                }
                .frame(height: 40.0)
                .background(Color.black)
                .accentColor(Color.white)
                .cornerRadius(12.0)
            }
            .padding(EdgeInsets(top: 16.0, leading: 16.0, bottom: 0, trailing: 16.0))
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: .zero) {
                        ForEach(0..<self.weekDays.count - 1) { index in
                            DayRow(title: DateFormatter.dayWithNumber.string(from: self.weekDays[index]),
                                   isSelected: self.selectedDay == self.weekDays[index])
                                .frame(minWidth: geometry.size.width / 6.9, maxWidth: .infinity)
                                .onTapGesture {
                                    self.onSelectDay?(self.weekDays[index])
                            }
                        }
                    }
                }
            }
            .frame(height: 53.0)
        }
    }
    
}

struct TasksHeader_Previews: PreviewProvider {
    static var previews: some View {
        TasksHeader(selectedDay: Date().startOfDay)
    }
}
