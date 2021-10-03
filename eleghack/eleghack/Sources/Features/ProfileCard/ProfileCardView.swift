//
//  ProfileCardView.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import SwiftUI
import UIKit

struct ProfileCardView: View {
    
    var inputUserID: Int!
    var inputUser: EmployeeModel!
    @State var user: EmployeeModel?
    
    
    @ObservedObject var presenter: ProfileCardPresenter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            HStack(alignment: .center, spacing: nil) {
                Spacer()
                VStack(alignment: .center, spacing: 4.0) {
                    Image(uiImage: imageForUser(id: user?.id ?? 0)).resizable().frame(width: 96.0, height: 96.0)
                    Text(user?.fullname ?? "").font(Fonts.semiBold)
                    Text(user?.role ?? "").font(Fonts.regularSecondary)
                }
                Spacer()
            }
            Text("Основная информация").font(Fonts.semiBold).padding(.leading, 8.0)
            VStack(alignment: .leading, spacing: 18.0) {
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("Фамилия, имя, отчество").font(Fonts.regularSecondary)
                    Text(user?.fullname ?? "").font(Fonts.regularPrimary)
                }
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("Должность").font(Fonts.regularSecondary)
                    Text(user?.role ?? "").font(Fonts.regularPrimary)
                }
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("Страна, город").font(Fonts.regularSecondary)
                    Text("Россия, Москва").font(Fonts.regularPrimary)
                }
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("Дата рождения").font(Fonts.regularSecondary)
                    Text(user?.birthDate ?? "").font(Fonts.regularPrimary)
                }
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("Телефон").font(Fonts.regularSecondary)
                    Text(user?.phone ?? "").font(Fonts.regularPrimary)
                }
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("Телеграм").font(Fonts.regularSecondary)
                    Text(user?.telegram ?? "").font(Fonts.regularPrimary)
                }
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("Электронная почта").font(Fonts.regularSecondary)
                    Text(user?.email ?? "").font(Fonts.regularPrimary)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .offset(CGSize(width: 18.0, height: 0.0)).background(Color.white).cornerRadius(12.0).shadow(color: Color(red: 57/255, green: 66/255, blue: 92/255).with(alpha: 0.07), radius: 20.0, x: 0, y: 1)
            .padding(EdgeInsets(top: 0.0, leading: 18.0, bottom: 0.0, trailing: 18.0))
            Spacer()
        }.onAppear() {
            self.user = inputUser
        }
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
}
