//
//  EmojiTableViewDataSource.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 02.10.2021.
//

import UIKit

protocol EmojiDataSourceDelegatable: AnyObject {
    func didTapToEmoji(emoji: String, indexPath: IndexPath)
}

final class EmojiDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var emojiModel: [CommonEntity] = []
    
    weak var delegate: EmojiDataSourceDelegatable?
    
    init(emojiModel: [CommonEntity]) {
        self.emojiModel = emojiModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = emojiModel[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: row.identifier, for: indexPath)
        
        (cell as? Setupable)?.setup(row)
        (cell as? Delegatable)?.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = emojiModel[indexPath.row] as? EmojiCellObject
        delegate?.didTapToEmoji(emoji: row?.title ?? "", indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return emojiModel[indexPath.row].size
    }
    
    func updateModel(model: [CommonEntity]) {
        self.emojiModel = model
    }
    
}
