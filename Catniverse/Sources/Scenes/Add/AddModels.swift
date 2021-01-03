//
//  AddModels.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/02.
//

enum AddModels {

  enum Model {

    struct Request {

    }

    struct Response {

    }

    struct ViewModel {

    }
  }
}

enum Bio: CaseIterable {
  case name
  case mission
  case charm
  case request
}

extension Bio {
  var title: String {
    switch self {
    case .name: return "내 이름은"
    case .mission: return "내 비밀 임무는"
    case .charm: return "내 매력 포인트는"
    case .request: return "날 마주친다면"
    }
  }
}
