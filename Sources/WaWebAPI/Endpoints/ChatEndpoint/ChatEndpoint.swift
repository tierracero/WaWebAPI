//
//  ChatEndpoint.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import Vapor
import WaWebAPICore

public final class ChatEndpoint: ChatComponents {

  var api: API

  init(api: API) {
    self.api = api
    super.init()
  }

  public init(
    app: Application,
    profile: WaWebInstances
  ) {
    self.api = .init(app: app, profile: profile)
    super.init()
  }

}
