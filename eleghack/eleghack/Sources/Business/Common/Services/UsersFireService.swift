//
//  UsersFireService.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Combine

protocol UsersFireServiceProtocol {
    //func currentUser() -> AnyPublisher<[User], Error>
    func observeUsers() -> AnyPublisher<[EmployeeModel]?, Never>
}

final class UsersFireService: UsersFireServiceProtocol {
    
    func observeUsers() -> AnyPublisher<[EmployeeModel]?, Never> {
        Publishers.FireBasePublisher().eraseToAnyPublisher()
    }
    
}

