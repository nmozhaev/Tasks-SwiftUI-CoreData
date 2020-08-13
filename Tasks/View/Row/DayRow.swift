//
//  DayRow.swift
//  Tasks
//
//  Created by Никита Можаев on 24.07.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import SwiftUI

struct DayRow: View {
    
    var title: String
    
    var isSelected: Bool
    
    private var accentColor: Color { isSelected ? Color.primaryColor : Color.black }
    
    var body: some View {
        VStack(spacing: 3.0) {
            Text(title)
                .bold()
                .multilineTextAlignment(.center)
                .font(.footnote)
                .foregroundColor(accentColor)
            if self.isSelected {
                Circle()
                    .fill(accentColor)
                    .frame(width: 5.0, height: 5.0)
                Spacer()
            } else {
                Spacer()
            }
        }
    }
}

struct DayRow_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            DayRow(title: "Sat\n17", isSelected: false)
            DayRow(title: "Sat\n17", isSelected: true)
        }
    }
}
