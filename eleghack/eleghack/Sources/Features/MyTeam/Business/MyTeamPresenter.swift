//
//  MyTeamPresenter.swift
//  e-legionHackiOS
//
//  Created by Ванурин Алексей Максимович on 02.10.2021.
//

import Foundation
import Combine

protocol MyTeamInteractor {
    func fetch() -> [EmployeeModel]
    func fetch() -> AnyPublisher<[EmployeeModel]?, Never>
}

final class MyTeamPresenter: ObservableObject {
    
    @Published var employes: [EmployeeModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        interactor: MyTeamInteractor
    ) {
        self.interactor = interactor
    }
    
    private var interactor: MyTeamInteractor!
    
    func onAppear() {
        //employes = interactor.fetch()
        interactor.fetch().receive(on: DispatchQueue.main).sink { completion in
            return
        } receiveValue: { [weak self] model in
            if let model = model {
                self?.employes = model
            }
        }.store(in: &cancellables)

        
//        interactor.fetch().receive(on: DispatchQueue.main).sink { completion in
//            return
//        } receiveValue: { [weak self] model in
//            self?.employes = model
//        }.store(in: &cancellables)

    }
    
}
