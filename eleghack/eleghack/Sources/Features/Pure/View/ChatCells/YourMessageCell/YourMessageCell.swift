//
//  YourMessageCell.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 02.10.2021.
//

import UIKit

final class YourMessageCell: UITableViewCell {
    
    @IBOutlet weak var avatarPost: UIImageView!
    @IBOutlet weak var nameOfPost: UILabel!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var emojiContainer: UIView!
    @IBOutlet weak var messageTextView: UILabel!
    
    weak var delegate: AnyObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension YourMessageCell: Delegatable, Setupable {
    
    func setup(_ object: Any) {
        guard let model = object as? YourMessageCellObject else { return }
        messageTextView.text = model.text
    }
    
}

struct YourMessageCellObject: CommonEntity {
    var identifier: String {
        return "YourMessageCell"
    }
    
    var size: CGSize = CGSize(width: 0, height: UITableView.automaticDimension)
    
    let title: String
    let text: String
    var titleOfEmoji: String = ""
}
