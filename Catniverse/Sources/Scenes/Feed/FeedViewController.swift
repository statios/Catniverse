//
//  FeedViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import AsyncDisplayKit
import CoreLocation
import RxSwift

protocol FeedDisplayLogic: class {
  
}

final class FeedViewController: BaseASViewController {
  
  // MARK: VIP
  var router: (FeedRoutingLogic & FeedDataPassing)?
  var interactor: FeedBusinessLogic?
  
}


// MARK: - Display Logic

extension FeedViewController: FeedDisplayLogic {

    
}
