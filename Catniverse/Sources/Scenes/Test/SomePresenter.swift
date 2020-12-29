//
//  SomePresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/30.
//

import UIKit
import RxSwift
import RxCocoa
import Resolver

final class SomePresenter: BasePresenter {
  
  @WeakLazyInjected var viewController: SomeViewController?

}


// MARK: - Presentation Logic

extension SomePresenter {
  func presentSomeUseCase(from response: Single<SomeModels.SomeUseCase.Response>) {
    let viewModel = response.map { _ in SomeModels.SomeUseCase.ViewModel() }
  }
}
