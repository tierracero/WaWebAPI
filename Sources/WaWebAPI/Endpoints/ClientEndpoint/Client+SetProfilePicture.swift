//
//  Client+SetProfilePicture.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.SetProfilePictureRequest: @retroactive Content {}


extension ClientEndpoint {
    
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
    
}
