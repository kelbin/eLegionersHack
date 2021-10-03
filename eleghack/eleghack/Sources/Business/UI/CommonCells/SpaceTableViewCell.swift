//
//  SpaceTableViewCell.swift
//
//  Created by Савченко Максим Олегович on 22.06.2021.
//

import UIKit

final class SpaceTableViewCell: UITableViewCell, Setupable {

    @IBOutlet weak var heightConstant: NSLayoutConstraint!
    @IBOutlet weak var spaceView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setup(_ object: Any) {
        guard let object = object as? SpaceEntity else { return }
        heightConstant.constant = object.spaceHeight
        spaceView.backgroundColor = object.backColor
        contentView.layoutIfNeeded()
    }
}

struct SpaceEntity: CommonEntity {
    var identifier: String {
        return "SpaceTableViewCell"
    }
    
    var spaceHeight: CGFloat
    var backColor: UIColor
    var size: CGSize = CGSize(width: 0, height: UITableView.automaticDimension)
}
