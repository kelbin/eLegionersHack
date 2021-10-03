//
//  MyFeed.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import SwiftUI

struct MyFeedView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 24.0) {
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("Привет,").font(Fonts.regularPrimary)
                    Text("Ванурин Алексей").font(Fonts.titleSemiBold)
                }
                Text("Ближайшие Собыйтия").font(Fonts.semiBold)
                VStack(alignment: .center, spacing: 4.0) {
                    EventCellView()
                }
                Spacer()
            }
            Spacer()
        }
    }
}
