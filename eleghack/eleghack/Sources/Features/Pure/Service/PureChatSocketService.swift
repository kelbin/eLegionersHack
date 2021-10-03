//
//  PureChatSocketService.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 02.10.2021.
//

import Foundation

protocol PureChatPresenterOutput: AnyObject {
    func didFetchData()
}

protocol PureChatService: AnyObject {
    func sendDataToSocket()
}

final class PureChatServiceImp: PureChatService {
    
    weak var presenter: PureChatPresenterOutput!
    
    init(presenter: PureChatPresenterOutput) {
        self.presenter = presenter
    }
    
    func sendDataToSocket() {
        
    }
}
