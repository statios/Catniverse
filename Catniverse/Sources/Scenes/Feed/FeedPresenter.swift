//
//  FeedPresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

protocol FeedPresentationLogic: class {
  
}

final class FeedPresenter: BasePresenter {
  
  weak var view: FeedDisplayLogic?

}


// MARK: - Presentation Logic

extension FeedPresenter: FeedPresentationLogic {
}
