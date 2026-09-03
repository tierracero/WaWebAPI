//
//  Instance+SincRecivedMesages.swift
//

import Foundation
import WaWebAPICore
import Vapor

extension InstanceComponents.SincRecivedMesagesRequest: Content {}

extension InstanceEndpoint {

    /// Synchronizes received messages from the preceding number of hours.
    /// `POST` https://waweb.tierracero.co/api/v1/message/sincRecivedMesages
    public func sincRecivedMesages(
        hours: Int
    ) throws -> EventLoopFuture<WAResponsePayload<SincRecivedMesagesResponse>> {
        try api.post(
            WAResponsePayload<SincRecivedMesagesResponse>.self,
            endpoint: .message("sincRecivedMesages"),
            payload: SincRecivedMesagesRequest(hours: hours)
        )
    }
}
