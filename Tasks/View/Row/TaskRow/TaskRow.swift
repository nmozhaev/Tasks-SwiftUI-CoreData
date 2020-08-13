//
//  TaskRow.swift
//  Tasks
//
//  Created by Никита Можаев on 24.07.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import SwiftUI

import Domain

struct TaskRow: View {
    
    var viewModel: TaskRowViewModel
    
    private var border: some View {
        GeometryReader { geometry in
            VStack(spacing: 8.0) {
                if self.viewModel.isSelected {
                    ZStack {
                        Circle()
                            .fill(Color.primaryColor)
                            .frame(width: 16.0, height: 16.0)
                        Circle()
                            .stroke(Color.primaryColor,
                                    lineWidth: 2.0)
                            .frame(width: 23.0, height: 23.0)
                    }
                    .padding(.top, 8.0)
                } else {
                    Path { path in
                        path.move(to: CGPoint(x: geometry.size.width / 2, y: 0))
                        path.addLine(to: CGPoint(x: geometry.size.width / 2,
                                                 y: 15.0))
                    }
                    .stroke(Color.primaryColor, lineWidth: 2.0)
                    .frame(height: 15.0)
                    Circle()
                        .stroke(Color.primaryColor,
                                lineWidth: 2.0)
                        .frame(width: 16.0, height: 16.0)
                }
                if self.viewModel.isLast {
                    Spacer()
                } else {
                    Path { path in
                        path.move(to: CGPoint(x: geometry.size.width / 2, y: 0))
                        path.addLine(to: CGPoint(x: geometry.size.width / 2,
                                                 y: geometry.size.height - self.viewModel.pathLengthOffset))
                    }
                    .stroke(Color.primaryColor, lineWidth: 2.0)
                }
            }
        }
        .frame(width: 40.0)
    }
    
    var body: some View {
        HStack(spacing: .zero) {
            border
            VStack(alignment: .leading, spacing: 12.0) {
                HStack {
                    Text(self.viewModel.title)
                        .font(.system(size: 19.0, weight: .bold))
                        .bold()
                    Spacer()
                    Text(self.viewModel.time)
                        .font(.subheadline)
                        .foregroundColor(Color.black.opacity(0.6))
                }
                HStack {
                    VStack {
                        Text(self.viewModel.text)
                            .foregroundColor(Color.black.opacity(0.6))
                            .multilineTextAlignment(.leading)
                            .font(.subheadline)
                            .frame(maxWidth: 150.0,
                                   alignment: Alignment.leading)
                        Spacer()
                    }
                    Spacer()
                    if self.viewModel.showCompleteButton {
                        Button(action: {
                            // TODO: Complete task
                        }) {
                            Image("checkmark")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .padding(.all, 14.0)
                        .background(Color.black)
                        .frame(width: 44.0, height: 44.0)
                        .cornerRadius(12.0)
                        .accentColor(Color.white)
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
            .padding(.all, 20.0)
            .background(self.viewModel.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
        }
//        .onTapGesture {
//            self.viewModel.isSelected.toggle()
//        }
    }
    
}

struct TaskRow_Previews: PreviewProvider {
    
    static let task = Task(id: UUID(),
                           title: "Meeting",
                           text: "Task number 1",
                           date: Date(),
                           isFinished: false)
    
    static var previews: some View {
        return TaskRow(viewModel: TaskRowViewModel(item: task, isSelected: true, isLast: false))
    }
}
