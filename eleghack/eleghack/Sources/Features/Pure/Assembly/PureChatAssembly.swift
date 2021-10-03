//
//  PureChatAssembly.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 02.10.2021.
//

import UIKit

final class PureChatAssembly {
    
    func configuredAssembly() -> PureChatVC {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PureChatVC") as! PureChatVC
        
        let presenter = PureChatPresenterImp(view: vc)
        let service: PureChatService = PureChatServiceImp(presenter: presenter)
        
        vc.presenter = presenter
        presenter.service = service
        
        return vc
    }
    
}
