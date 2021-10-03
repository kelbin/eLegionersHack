//
//  HumanCell.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 01.10.2021.
//

import SwiftUI

struct HumanCell: View {
    
    @State var human: EmployeeModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 14.0) {
            Image(uiImage: imageForUser(id: human.id))
            VStack(alignment: .leading, spacing: 4.0) {
                Text(human.fullname).font(Fonts.regularPrimary).foregroundColor(.black)
                Text(human.role).font(Fonts.regularSecondary).foregroundColor(.black)
                Text(stubStatus(id: human.id) ).font(Fonts.regularSecondary)
            }
            Spacer()
            VStack(alignment: .leading, spacing: nil) {
                Image(uiImage: Icons.more)
                Spacer()
            }
        }.padding(SwiftUI.EdgeInsets(top: 4.0, leading: 0.0, bottom: 4.0, trailing: 12.0))
    }
    
    func imageForUser(id: Int) -> UIImage {
        switch id {
        case 0:
            return Icons.avatar0
        case 1:
            return Icons.avatar1
        case 2:
            return Icons.avatar2
        case 3:
            return Icons.avatar3
        default:
            return Icons.stubAvatar
        }
    }
    
    func stubStatus(id: Int) -> String {
        switch id {
        case 0:
            return ""
        case 1:
            return "Статус: на больничном"
        case 2:
            return ""
        case 3:
            return "Скоро в отпуск"
        default:
            return ""
        }
    }
    
}
