//
//  MatchVC.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 03.10.2021.
//

import UIKit

final class MatchVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }

    @IBAction func tapToTelegram(_ sender: Any) {
        
        let botURL = URL.init(string: "https://t.me/Kelbinary")
        
        if UIApplication.shared.canOpenURL(botURL!) {
            UIApplication.shared.open(botURL!, options: [:], completionHandler: nil)
        } else {
          // Telegram is not installed.
        }
    }
    
}
