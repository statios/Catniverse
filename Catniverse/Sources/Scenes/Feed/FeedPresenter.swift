//
//  FeedPresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/31.
//

import UIKit

protocol FeedPresentationLogic: class {
  
}

final class FeedPresenter: BasePresenter {
  
  weak var viewController: FeedDisplayLogic?

}


// MARK: - Present
extension FeedPresenter: FeedPresentationLogic {
  
}
