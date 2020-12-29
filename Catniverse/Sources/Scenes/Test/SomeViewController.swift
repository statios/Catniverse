//
//  SomeViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/30.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

final class SomeViewController: BaseASViewController {

  // MARK: VIP
  @Injected var interactor: SomeInteractor
  
  override func configure() {
    requestSomeUseCase(from: rx.viewWillAppear.asObservableVoid())
  }
}

// MARK: - Send
extension SomeViewController {
  func requestSomeUseCase(from trigger: Observable<Void>) {
    let request = trigger.map { SomeModels.SomeUseCase.Request() }
    interactor.responseSomeUseCase(from: request)
  }
}

// MARK: - Bind
extension SomeViewController {
  func displaySomeUseCase(
    from viewModel: Driver<SomeModels.SomeUseCase.ViewModel>
  ) {
    
  }
}

