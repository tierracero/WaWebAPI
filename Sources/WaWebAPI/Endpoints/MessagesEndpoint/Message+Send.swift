//
//  Message+Send.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFundamentals
import Vapor
import WaWebAPICore

extension MessageEndpoint.SendMessageTextRequest: @retroactive Content {}

extension MessageEndpoint.SendMessageMediaRequest: @retroactive Content {}

extension MessageEndpoint.SendMessageLocationRequest: @retroactive Content {}

extension MessageEndpoint.SendMessagePollRequest: @retroactive Content {}
