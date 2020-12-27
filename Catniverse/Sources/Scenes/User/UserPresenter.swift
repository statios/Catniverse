//
//  UserPresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

protocol UserPresentationLogic: class {
  
}

final class UserPresenter: BasePresenter {
  
  weak var view: UserDisplayLogic?

}


// MARK: - Presentation Logic

extension UserPresenter: UserPresentationLogic {
  
}
