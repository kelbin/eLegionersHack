//
//  CalendarView.swift
//  eleghack
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import SwiftUI


struct CalendarDaysButton: Identifiable {
    var id: Int { return day }
    var day: Int
    var name: String
}

struct MeetModel: Identifiable {
    var id: Int
    
    var title: String
    var startTime: String
    var endTime: String
    
}

struct CalendarView: View {
    
    @State var daysToChoose: [CalendarDaysButton] = [
        .init(day: 30, name: "Чт"),
        .init(day: 1, name: "Пт"),
        .init(day: 2, name: "Сб"),
        .init(day: 3, name: "Вс"),
        .init(day: 4, name: "Пн"),
        .init(day: 5, name: "Вт"),
        .init(day: 6, name: "Ср"),
    ]
    
    var today = 3
    @State var currentDay: Int = 3
    @State var meets: [MeetModel] = []
    
    var todayMeets: [MeetModel] = [
        .init(id: 0, title: "Дедлайн сдачи заданий", startTime: "11:00", endTime: "11:00"),
        .init(id: 1, title: "Питчи финалистов", startTime: "15:00", endTime: "17:00"),
        .init(id: 2, title: "Церемония награждения", startTime: "18:00", endTime: "19:00"),
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: nil) {
            
            // Верхнияя плашка
            
            HStack(alignment: .center, spacing: nil) {
                Text("3").font(Fonts.titleBigBold)
                VStack(alignment: .leading, spacing: nil) {
                    Spacer()
                    Text("Воскресенье").font(Fonts.regularSecondary)
                    Text("3.10.2021").font(Fonts.regularSecondary)
                    Spacer()
                }
                Spacer()
                Button("Сегодня"){ }.font(Fonts.semiBold).background(Colors.controlColor).cornerRadius(4.0)
            }.frame(maxWidth: .infinity, maxHeight: 50.0)
            VStack(alignment: .center, spacing: nil) {
                HStack(alignment: .center, spacing: nil) {
                    Spacer()
                    Group {
                        ForEach(daysToChoose) { day in
                            if currentDay == day.day {
                                VStack(alignment: .center, spacing: nil) {
                                    Text(String(day.day)).font(Fonts.regularPrimary).foregroundColor(Color.white)
                                    Text(day.name).font(Fonts.semiBold).foregroundColor(Color.white)
                                }.background(Color.blue)
                                Spacer()
                            } else {
                                VStack(alignment: .center, spacing: nil) {
                                    Text(String(day.day)).font(Fonts.regularPrimary)
                                    Text(day.name).font(Fonts.semiBold)
                                }.onTapGesture {
                                    if day.day == today {
                                        self.meets = todayMeets
                                    } else {
                                        self.meets = []
                                    }
                                    currentDay = day.day
                                }
                                Spacer()
                            }}
                    }
                }.frame(maxWidth: .infinity, maxHeight: 110.0)
                
                HStack(alignment: .firstTextBaseline, spacing: 16.0) {
                    Text("Время").font(Fonts.regularPrimary)
                    Spacer()
                    Text("Расписание").font(Fonts.regularPrimary)
                    Spacer()
                }.padding(.leading, 6.0)
                
                List(meets) { meet in
                    MeetCell(title: meet.title, startTime: meet.startTime, endTime: meet.endTime).frame(maxWidth: .infinity, maxHeight: 240)
                }.listRowBackground(Color.white)
            }.background(Color.white).cornerRadius(24.0).padding(SwiftUI.EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)).listRowBackground(Color.white)
        }.padding(SwiftUI.EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)).background(Colors.secondaryBackground).onAppear {
            
            self.meets = todayMeets
            
            
        }
    }
    
}
