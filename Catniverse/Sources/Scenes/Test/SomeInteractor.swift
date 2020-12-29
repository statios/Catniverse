//
//  SomeInteractor.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/30.
//

import Foundation
import RxSwift
import RxCocoa
import Resolver

final class SomeInteractor: BaseInteractor {

  @Injected var worker: SomeWorker
  @Injected var presenter: SomePresenter
  
}


// MARK: - Business Logic
extension SomeInteractor {
  func responseSomeUseCase(from request: Observable<SomeModels.SomeUseCase.Request>) {
    let response = request.map { _ in SomeModels.SomeUseCase.Response() }.asSingle()
    presenter.presentSomeUseCase(from: response)
  }
}
