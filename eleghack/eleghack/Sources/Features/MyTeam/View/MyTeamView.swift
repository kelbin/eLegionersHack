//
//  MyTeamView.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import SwiftUI

struct MyTeamView: View {
    
    @State var searchEntry: String = ""
    @State var isActive: Bool = false
    @ObservedObject var presenter: MyTeamPresenter
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 5.0) {
                HStack(alignment: .center, spacing: 14.0) {
                    Text("Привет,").font(Fonts.semiBold)
                    Spacer()
                    NavigationLink(destination: CalendarView()) {
                        Image(uiImage: Icons.calendar)
                    }
                }
                Text("Алексей").font(Fonts.titleSemiBold)
                SearchBar(text: $searchEntry)
                Text("Моя команда").font(Fonts.semiBold)
                VStack(alignment: .leading, spacing: 8.0) {
                    Group {
                        ForEach(presenter.employes) { employee in
                            if searchEntry.isEmpty || employee.lastName.contains(searchEntry) || employee.firstName.contains(searchEntry) {
                                NavigationLink(destination: goto(userId: employee.id)) {
                                    HumanCell(human: employee)
                                        .frame(maxWidth: .infinity, maxHeight: 100.0, alignment: .leading).background(Color.white).cornerRadius(12.0).shadow(color: Color(red: 57/255, green: 66/255, blue: 92/255).with(alpha: 0.07), radius: 20.0, x: 0, y: 1)
                                }
                            }
                        }
                        
                    }}
                Spacer()
            }.onAppear(perform: fetch).padding(SwiftUI.EdgeInsets(top: 0.0, leading: 18.0, bottom: 0.0, trailing: 18.0))
        }
    }
    
    
    private func fetch() {
        presenter.onAppear()
    }
    
    func goto(userId: Int) -> ProfileCardView {
        var vc = DependencyProvider.resolver.resolve(ProfileCardView.self)!
        vc.inputUser = presenter.employes.first(where: { $0.id == userId })
        vc.inputUserID = userId
        return vc
    }
    
}

struct MyTeamView_Previews: PreviewProvider {
    static var previews: some View {
        DependencyProvider.resolver.resolve(MyTeamView.self)
    }
}
