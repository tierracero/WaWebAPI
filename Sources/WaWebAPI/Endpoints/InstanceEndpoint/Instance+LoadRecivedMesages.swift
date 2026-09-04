//
//  Instance+LoadRecivedMesages.swift
//

import Foundation
import WaWebAPICore
import Vapor

extension InstanceComponents.LoadRecivedMesagesRequest: Content {}

extension InstanceEndpoint {

    /// Synchronizes received messages from the preceding number of hours.
    /// `POST` https://waweb.tierracero.co/api/v1/instance/loadRecivedMesages
    public func loadRecivedMesages(
        days: Int
    ) throws -> EventLoopFuture<WAResponsePayload<LoadRecivedMesagesResponse>> {
        try api.post(
            WAResponsePayload<LoadRecivedMesagesResponse>.self,
            endpoint: .instance("loadRecivedMesages"),
            payload: LoadRecivedMesagesRequest(days: days)
        )
    }
}
