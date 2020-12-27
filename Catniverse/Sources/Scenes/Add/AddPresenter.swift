//
//  AddPresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

protocol AddPresentationLogic: class {
  
}

final class AddPresenter: BasePresenter {
  
  weak var view: AddDisplayLogic?

}


// MARK: - Presentation Logic

extension AddPresenter: AddPresentationLogic {
  
}
