//
//  EnemyMessageCell.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 02.10.2021.
//

import UIKit

protocol EnemyMessageDelegatable: AnyObject {
    func tapToMessage(model: EnemyMessageCellObject)
}

final class EnemyMessageCell: UITableViewCell, Delegatable, Setupable {
    
    weak var delegate: AnyObject?
    var model: EnemyMessageCellObject?
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var emojiContainer: UIView!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameOfPost: UILabel!
    @IBOutlet weak var dateOfMessage: UILabel!
    @IBOutlet weak var avatarOfPost: UIImageView!
    
    var twitterLikeImageView: TwitterImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let longGestureTap = UILongPressGestureRecognizer(target: self, action: #selector(tapToMessage))
        longGestureTap.minimumPressDuration = 0.3
        longGestureTap.delaysTouchesEnded = true
        messageView.addGestureRecognizer(longGestureTap)
    }
    
    @objc func tapToMessage(gesture:UIGestureRecognizer) {
        if gesture.state == .began {
            UIView.animate(withDuration: 0.2) {
                self.messageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
        }
        
        if gesture.state == .ended {
            
        UIView.animate(withDuration: 0.2) {
        } completion: { finish in
            
            UIView.animate(withDuration: 0.2) {
                self.messageView.transform = .identity
            }
            
            guard let model = self.model,
                  let delegate = self.delegate as? EnemyMessageDelegatable else { return }
            delegate.tapToMessage(model: model)
        }
        }
    }
    
    func setup(_ object: Any) {
        guard let object = object as? EnemyMessageCellObject else { return }
        self.model = object
        
        if !(model?.titleOfEmoji.isEmpty ?? false) {
            showEmojiView(emoji: object.titleOfEmoji)
        }
    }
    
    private func showEmojiView(emoji: String) {
        emojiContainer.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 1.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(3.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    self.emojiLabel.alpha = 1
                                    self.emojiLabel.text = "\(emoji) 1"
                                    self.emojiContainer.alpha = 1
                                    self.emojiContainer.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
    }

}

struct EnemyMessageCellObject: CommonEntity {
    var identifier: String {
        return "EnemyMessageCell"
    }
    
    var size: CGSize = CGSize(width: 0, height: UITableView.automaticDimension)
    
    let title: String
    var titleOfEmoji: String = ""
}
