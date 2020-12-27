//
//  BaseASViewController.swift
//  InstaClone
//
//  Created by Stat on 2020/12/23.
//

import AsyncDisplayKit
import RxSwift

class BaseASViewController: ASDKViewController<BaseNode> {
  
  var disposeBag = DisposeBag()
  
  override init() {
    super.init(node: BaseNode())
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
