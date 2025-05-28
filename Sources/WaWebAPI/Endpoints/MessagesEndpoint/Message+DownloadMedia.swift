//
//  Message+DownloadMedia.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.DownloadMediaRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/downloadMedia
    /// - Parameter messageId: String
    /// - Returns:
    public func downloadMedia(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("downloadMedia"), payload: DownloadMediaRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
