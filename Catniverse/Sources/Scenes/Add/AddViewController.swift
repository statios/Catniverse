//
//  AddViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/02.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

protocol AddDisplayLogic: class {

}

final class AddViewController: BaseASViewController {

  @Injected var interactor: AddBusinessLogic
  @Injected var router: (AddRoutingLogic & AddDataPassing)
  
  private lazy var tableNode = ASTableNode().then {
    $0.dataSource = self
    $0.delegate = self
  }
  
  private let bios = Bio.allCases
}

// MARK: - Configure
extension AddViewController {
  override func configure() {
    if let router = router as? AddRouter,
       let interactor = interactor as? AddInteractor,
       let presenter = interactor.presenter as? AddPresenter {
      router.viewController = self
      presenter.viewController = self
    }
  }
}

// MARK: - Layout
extension AddViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .zero,
      child: tableNode
    )
  }
}

// MARK: - Request
extension AddViewController {
  
}

// MARK: - Display
extension AddViewController: AddDisplayLogic {

}

// MARK: - TableDataSource
extension AddViewController: ASTableDataSource, ASTableDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = UIView()
    header.backgroundColor = .blue
    return header
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return Device.width
  }
  
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return bios.count
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    return { [weak self] in
      let cell = AddCellNode()
      let item = self?.bios[indexPath.row]
      cell.configure(bio: item)
      return cell
    }
  }
}
