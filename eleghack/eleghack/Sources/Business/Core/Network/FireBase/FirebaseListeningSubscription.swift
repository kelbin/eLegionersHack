//
//  Subscription.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Combine
import Firebase

final class FireBaseSubscription<S: Subscriber>: Subscription where S.Input == [EmployeeModel]?, S.Failure == Never {
    
    private var db: Firestore
    private var subcriber: S?
    
    init(subscriber: S, firestore: Firestore) {
        self.subcriber = subscriber
        self.db = firestore
        
        self.db.collection("users").addSnapshotListener { query, error in
            guard let q = query else { fatalError() }
            
            let users: [EmployeeModel] = q.documents.map { document in
                return try! document.data(as: EmployeeModel.self)! }
            _ = subscriber.receive(users)
            }
        }
    
    func request(_ demand: Subscribers.Demand) {}

    func cancel() {}
}
