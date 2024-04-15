//
//  Client+SetProfilePicture.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

extension ClientEndpoint {
    
    public struct SetProfilePictureRequest: CrossPlatformContent {
        
        public let media: MessageMedia
        
        public init(
            media: MessageMedia
        ) {
            self.media = media
        }
        
    }
    
#if canImport(Vapor)
    /// Sets the current user's profile picture.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/setProfilePicture
    /// - Returns: Promise containing boolean, Returns true if the picture was properly updated.
    public func setProfilePicture(
        media: MessageMedia
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("setProfilePicture"), payload: SetProfilePictureRequest(
                media: media
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
