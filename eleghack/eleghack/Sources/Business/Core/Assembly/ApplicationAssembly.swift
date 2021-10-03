//
//  ApplicationAssembly.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Swinject


final class DependencyProvider {
    static let assembler = Assembler([
        RootTabBarAssembly(),
        MyTeamAssembly(),
        ProfileCardAssembly(),
        MyFeedAssembly(),
    ])
    static var resolver: Resolver {
        return assembler.resolver
    }
}
