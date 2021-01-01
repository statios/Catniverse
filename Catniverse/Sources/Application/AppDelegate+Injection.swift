//
//  AppDelegate+Injection.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    register { LocationWorker() }
      .implements(LocationWorkerLoginc.self)
      .scope(shared)
    
    FeedRouter.registerAllServices()
  }
}
