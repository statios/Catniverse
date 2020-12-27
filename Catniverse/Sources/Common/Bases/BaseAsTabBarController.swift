//
//  BaseAsTabBarController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import AsyncDisplayKit
import RxSwift

class BaseAsTabBarController: ASTabBarController {
  
  var disposeBag = DisposeBag()
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
    Log.verbose(String(describing: Self.self))
    configure()
    setupUI()
    sendRequest()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc dynamic func configure() {
    
  }
  
  @objc dynamic func sendRequest() {
    
  }
  
  @objc dynamic func setupUI() {
    
  }
}

