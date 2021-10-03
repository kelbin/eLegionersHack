//
//  EmployeeModel.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

struct EmployeeModel: Identifiable, Codable {
    var id: Int
    
    var firstName: String
    var lastName: String
    var birthDate: String?
    
    var role: String
    
    var telegram: String
    var email: String
    var phone: String
    
    var zodiac: String
    var hobbies: [String]
    
    var fullname: String {
        return "\(lastName) \(firstName)"
    }
    
}
