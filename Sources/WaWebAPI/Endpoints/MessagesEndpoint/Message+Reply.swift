//
//  Message+Reply.swift
//
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFundamentals
import Vapor
import WaWebAPICore

extension MessageEndpoint.ReplyRequest: @retroactive Content {}
