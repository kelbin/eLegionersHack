//
//  ProfileCardAssembly.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Swinject


final class ProfileCardAssembly: Assembly {
    
    func assemble(container: Container) {
        registerView(container)
        registerPresenter(container)
        //registerInteractor(container)
    }
    
}

private extension ProfileCardAssembly {
    
    func registerView(_ container: Container) {
        container.register(ProfileCardView.self) { resover in
            let presenter = resover.resolve(ProfileCardPresenter.self)!
            let viewContoller = ProfileCardView(presenter: presenter)
            
            return viewContoller
        }
    }
    
    func registerPresenter(_ container: Container) {
        container.register(ProfileCardPresenter.self) { resolver in
            //let interactor = resolver.resolve(MyTeamInteractor.self)!
            let presenter = ProfileCardPresenter()
            
            return presenter
        }
    }
    
//    func registerInteractor(_ container: Container) {
//        container.register(MyTeamInteractor.self) { resolver in
//            let interactor = MyTeamInteractorImp()
//
//            return interactor
//        }
//    }
    
}
