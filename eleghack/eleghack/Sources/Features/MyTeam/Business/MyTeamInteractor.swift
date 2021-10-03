//
//  MyTeamInteractor.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Combine

final class MyTeamInteractorImp: MyTeamInteractor {
    func fetch() -> AnyPublisher<[EmployeeModel]?, Never> {
        return service.observeUsers()
    }
    
    var service = UsersFireService()
    
//    func fetch() -> AnyPublisher<[EmployeeModel], Error> {
//        let p = EntityPublisher()
//
//        URLSession.shared.dataTaskPublisher(for: URL(string: "")!)
//        return AnyPublisher<[EmployeeModel], Error>.
//    }
//
    func fetch() -> [EmployeeModel] {
        return[
            //.init(id: 1, name: "Олег", titul: "Сеньор", status: "Занят"),
            //.init(id: 1, name: "Олег", titul: "Сеньор", status: "Занят"),
            //.init(id: 1, name: "Олег", titul: "Сеньор", status: "Занят"),
        ]
    }
    
}

//struct EntityPublisher: Publisher {
//    func receive<S>(subscriber: S) where S : Subscriber, Error == S.Failure, [EmployeeModel] == S.Input {}
//
//    typealias Output = [EmployeeModel]
//    typealias Failure = Error
//
//}
