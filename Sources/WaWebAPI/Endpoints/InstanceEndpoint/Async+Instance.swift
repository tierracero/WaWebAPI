import Foundation
import TCFoundation
import TCFundamentals
import Vapor
import WaWebAPICore

extension InstanceEndpoint {

  public func status(
    containerId: String,
    containerPort: Int
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .instance("create"),
      payload: CreateRequest(
        containerId: containerId,
        containerPort: containerPort
      ))
  }

  public func destroy(
    containerId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .instance("destroy"),
      payload: DestroyRequest(
        containerId: containerId
      ))
  }

  public func loadRecivedMesages(
    days: Int
  ) async throws -> WAResponsePayload<LoadRecivedMesagesResponse> {
    return try await api.post(
      WAResponsePayload<LoadRecivedMesagesResponse>.self,
      endpoint: .instance("loadRecivedMesages"),
      payload: LoadRecivedMesagesRequest(days: days)
    )
  }

  public func sincRecivedMesages(
    hours: Int
  ) async throws -> WAResponsePayload<SincRecivedMesagesResponse> {
    return try await api.post(
      WAResponsePayload<SincRecivedMesagesResponse>.self,
      endpoint: .instance("sincRecivedMesages"),
      payload: SincRecivedMesagesRequest(hours: hours)
    )
  }

  public func start(
    containerId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .instance("start"),
      payload: StartRequest(
        containerId: containerId
      ))
  }

  public func status(
    containerId: String
  ) async throws -> WAResponsePayload<StatusResponse> {
    return try await api.post(
      WAResponsePayload<StatusResponse>.self, endpoint: .instance("status"),
      payload: StopRequest(
        containerId: containerId
      ))
  }

  public func stop(
    containerId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .instance("stop"),
      payload: StopRequest(
        containerId: containerId
      ))
  }

}
