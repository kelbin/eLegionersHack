//
//  TitleHeaderMessageCell.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 03.10.2021.
//

import UIKit

final class TitleHeaderMessageCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

struct TitleHeaderMessageCellObject: CommonEntity {
    var identifier: String {
        return "TitleHeaderMessageCell"
    }
    
    var size: CGSize = CGSize(width: 40, height: 40)
    
    let title: String
}
