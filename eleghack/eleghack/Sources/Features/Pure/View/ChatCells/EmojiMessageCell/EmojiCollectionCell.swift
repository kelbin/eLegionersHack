//
//  EmojiCollectionCell.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 02.10.2021.
//

import UIKit

final class EmojiCollectionCell: UICollectionViewCell, Setupable {
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ object: Any) {
        guard let object = object as? EmojiCellObject else { return }
        emojiLabel.text = object.title
    }

}

struct EmojiCellObject: CommonEntity {
    var identifier: String {
        return "EmojiCollectionCell"
    }
    
    var size: CGSize = CGSize(width: 40, height: 40)
    
    let title: String
}
