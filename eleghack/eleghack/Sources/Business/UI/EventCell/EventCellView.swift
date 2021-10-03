//
//  EventCellView.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import SwiftUI

struct EventCellView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            HStack(alignment: .center, spacing: 14.0) {
                Image(uiImage: Icons.stubEvent)
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Йога").font(Fonts.semiBold)
                    Text("Москва, Петровский б-р, 7с1").font(Fonts.regularPrimary)
                    Text("10 окт. 2021, 19:00").font(Fonts.regularSecondary)
                    //Spacer()
                }
            }
        }
    }
}

struct EventCellView_Previews: PreviewProvider {
    static var previews: some View {
        EventCellView()
    }
}
