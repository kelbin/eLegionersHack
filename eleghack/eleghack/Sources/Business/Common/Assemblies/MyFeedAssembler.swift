//
//  MyFeedAssembler.swift
//  eleghack
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Foundation
import Swinject


final class MyFeedAssembly: Assembly {
    
    func assemble(container: Container) {
        registerView(container)
    }
    
}

private extension MyFeedAssembly {
    
    func registerView(_ container: Container) {
        container.register(MyFeedView.self) { resover in
            let viewControler = MyFeedView()
            
            return viewControler
        }
    }
    
}
