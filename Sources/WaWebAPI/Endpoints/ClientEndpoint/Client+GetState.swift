//
//  Client+GetState.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint {
    
    public struct GetStateResponse: Content, Payloadable {
        
        /// conflict, connected, deprecatedVersion, opening, pairing, proxyblock, SMBTosBlock, timeout, TOSBlock, unlaunched, unpaired, unpairedIdle
        public let state: WAState
        
        /// booting, loadingScreen, qr, authenticated, authFailure, ready, disconnected
        public let status: InstanceStatus
        
        public init(
            state: WAState,
            status: InstanceStatus
        ) {
            self.state = state
            self.status = status
        }
        
    }
    
    /// Gets the current connection state for the client
    /// `POST` https://waweb.tierracero.co/api/v1/client/getState
    /// - Returns: Promise containing WAState
    public func getState() throws -> EventLoopFuture<WAResponsePayload<GetStateResponse>>{
        do {
            return try api.post(WAResponsePayload<GetStateResponse>.self, endpoint: .client("getState"))
        }
        catch {
            throw error
        }
    }
    
}
