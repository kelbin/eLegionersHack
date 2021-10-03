//
//  RootTabBar.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import UIKit
import SwiftUI


final class RootTabBarViewContoller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(myteamView: MyTeamView, feed: MyFeedView, pure: UINavigationController) {
        let vc1 = UIHostingController(rootView: feed)
        vc1.tabBarItem = UITabBarItem(title: nil, image: Icons.tabBar1, tag: 0)
        
        let vc3 = pure
        vc3.tabBarItem = UITabBarItem(title: nil, image: Icons.tabBar3, tag: 3)
        
        let vc4 = UIHostingController(rootView: myteamView)
        vc4.tabBarItem = UITabBarItem(title: nil, image: Icons.tabBar4, tag: 3)
        
        self.viewControllers = [vc1, vc3, vc4]
    }
}
