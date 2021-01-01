//
//  AddPresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/02.
//

import UIKit

protocol AddPresentationLogic: class {
  
}

final class AddPresenter: BasePresenter {
  
  weak var viewController: AddDisplayLogic?

}

// MARK: - Present
extension AddPresenter: AddPresentationLogic {
  
}
