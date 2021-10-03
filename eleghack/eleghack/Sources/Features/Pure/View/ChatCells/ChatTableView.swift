//
//  ChatTableView.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 02.10.2021.
//

import UIKit

class ChatTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.transform = CGAffineTransform(rotationAngle: 90)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
