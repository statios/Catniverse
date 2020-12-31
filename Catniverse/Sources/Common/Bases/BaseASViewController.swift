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
    node.layoutSpecBlock = { [weak self] (node, size) -> ASLayoutSpec in
      self?.layoutSpec(node: node, size: size) ?? ASLayoutSpec()
    }
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
    disposeBag = DisposeBag()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc dynamic func configure() {
    
  }
  
  @objc dynamic func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    return ASLayoutSpec()
  }
}
