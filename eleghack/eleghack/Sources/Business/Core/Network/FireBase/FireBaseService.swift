//
//  FireBaseService.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Firebase

final class FireBaseServiceDefault {
    
    var db: Firestore
    
    init() {
        db = Firestore.firestore()
    }
    
}
