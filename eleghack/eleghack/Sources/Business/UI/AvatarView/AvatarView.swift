//
//  AvatarView.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import SwiftUI
import UIKit

struct AvatarView: View {
    
    @State var name: String
    @State var role: String
    @State var avatar: UIImage
    
    var body: some View {
        VStack(alignment: .center, spacing: 4.0) {
            Image(uiImage: avatar)
            Text(name)
            Text(role)
        }
    }
}
