//
//  RootTabBarAssembly.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Swinject
import SwiftUI


final class RootTabBarAssembly: Assembly {
    
    func assemble(container: Container) {
        registerView(container)
    }
    
    func registerView(_ container: Container) {
        container.register(RootTabBarViewContoller.self) { resolver in
            let myTeamViewController = container.resolve(MyTeamView.self)!
            
            let assemblyVC = PureChatAssembly().configuredAssembly()
            let navigationController = UINavigationController(rootViewController: assemblyVC)
            
            let feedVideController = container.resolve(MyFeedView.self)!
            //let pureViewController = container.resolve(PureViewContoller.self)!
            let pureViewController = PureViewContoller()
            
            let viewController = RootTabBarViewContoller()
            viewController.setup(myteamView: myTeamViewController, feed: feedVideController, pure: navigationController)
            
            return viewController
        }
    }
    
}
