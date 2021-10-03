//
//  FirebaseQueryPublisher.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Firebase
import Combine
import FirebaseFirestoreSwift

extension Publishers {
    struct FireBasePublisher: Publisher {
        typealias Output = [EmployeeModel]?
        typealias Failure = Never
        
        func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
            let subscription = FireBaseSubscription(subscriber: subscriber, firestore: Firestore.firestore())
            subscriber.receive(subscription: subscription)
        }
    }
}
