//
//  PureChatPresenter.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 02.10.2021.
//

import Foundation

protocol PureChatPresenterInput: ViewState {
    func sendMessage(with text: String)
}

final class PureChatPresenterImp: PureChatPresenterInput, PureChatPresenterOutput {

    weak var view: PureChatInput!
    var service: PureChatService!
    
    var model: [CommonEntity] = []
    
    init(view: PureChatInput) {
        self.view = view
    }
    
    func viewDidLoad() {
        let titleHeader = TitleHeaderMessageCellObject(title: "30 сент. 2021")
        let enemyMessageViewModel = EnemyMessageCellObject(title: "Text")
        let spaceMessageViewModel = SpaceEntity(spaceHeight: 24, backColor: #colorLiteral(red: 0.9750029445, green: 0.9783667922, blue: 0.9844790101, alpha: 1))
        
        let list = getListOfEmojis()
        
        view.updateModel(emojiModel: list)
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
            self.model += [titleHeader, spaceMessageViewModel, enemyMessageViewModel]
            self.view.updateModel(self.model, isClient: false)
        }
        
    }
    
    private func getListOfEmojis() -> [CommonEntity] {
        var cellsObject: [CommonEntity] = []
        
        for i in 0x1F601...0x1F64F {
            guard let scalar = UnicodeScalar(i) else { continue }
            let c = String(scalar)
            cellsObject.append(EmojiCellObject(title: c))
        }
        
        return cellsObject
    }
    
    func didFetchData() {
        
    }
    
    func sendMessage(with text: String) {
        let yourMessage = YourMessageCellObject(title: "Толстый кабан", text: text)
        let spaceMessageViewModel = SpaceEntity(spaceHeight: 24, backColor: #colorLiteral(red: 0.9750029445, green: 0.9783667922, blue: 0.9844790101, alpha: 1))
        
        model.append(yourMessage)
        
        self.view.updateModel(self.model, isClient: true)
    }
    
}
