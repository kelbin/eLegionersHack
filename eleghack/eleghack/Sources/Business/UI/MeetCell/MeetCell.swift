//
//  MeetCell.swift
//  eleghack
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import SwiftUI

struct MeetCell: View {
    
    @State var title: String
    @State var startTime: String
    @State var endTime: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 16.0) {
            VStack(alignment: .leading, spacing: nil) {
                Text(startTime).font(Fonts.regularPrimary)
                Text(endTime).font(Fonts.regularSecondary)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(title).font(Fonts.semiBold)
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: nil) {
                    Image(uiImage: Icons.avatar0).resizable().frame(maxWidth: 24.0, maxHeight: 24.0)
                    Text("Ванурин Алексей").font(Fonts.regularPrimary)
                }
            }.frame(maxWidth: .infinity, maxHeight: 240.0, alignment: .leading).background(Colors.secondaryBackground).cornerRadius(12.0).shadow(color: Color(red: 57/255, green: 66/255, blue: 92/255).with(alpha: 0.07), radius: 20.0, x: 0, y: 1)
        }
    }
}

