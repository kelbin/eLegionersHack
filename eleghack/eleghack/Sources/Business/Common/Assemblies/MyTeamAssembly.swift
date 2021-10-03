//
//  MyTeamAssembly.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Swinject


final class MyTeamAssembly: Assembly {
    
    func assemble(container: Container) {
        registerView(container)
        registerPresenter(container)
        registerInteractor(container)
    }
    
}

private extension MyTeamAssembly {
    
    func registerView(_ container: Container) {
        container.register(MyTeamView.self) { resover in
            let presenter = resover.resolve(MyTeamPresenter.self)!
            let viewContoller = MyTeamView(presenter: presenter)
            
            return viewContoller
        }
    }
    
    func registerPresenter(_ container: Container) {
        container.register(MyTeamPresenter.self) { resolver in
            let interactor = resolver.resolve(MyTeamInteractor.self)!
            let presenter = MyTeamPresenter(interactor: interactor)
            
            return presenter
        }
    }
    
    func registerInteractor(_ container: Container) {
        container.register(MyTeamInteractor.self) { resolver in
            let interactor = MyTeamInteractorImp()
            
            return interactor
        }
    }
    
}
