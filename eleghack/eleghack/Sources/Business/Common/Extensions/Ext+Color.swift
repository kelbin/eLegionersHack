//
//  Ext+Color.swift
//  eleghack
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//
import SwiftUI


extension Color {
    
    func with(alpha: Double) -> Color {
        return self.opacity(alpha)
    }
    
}
