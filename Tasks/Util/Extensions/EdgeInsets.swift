//
//  EdgeInsets.swift
//  Tasks
//
//  Created by Никита Можаев on 10.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import SwiftUI

extension EdgeInsets {
    
    static let zero: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    init(horizontal: CGFloat) {
        self.init(top: 0, leading: horizontal, bottom: 0, trailing: horizontal)
    }
    
    init(vertical: CGFloat) {
        self.init(top: vertical, leading: 0, bottom: vertical, trailing: 0)
    }
    
}
