//
//  post.swift
//
//
//  Created by Victor Cantu on 2/29/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
#if canImport(Crypto)
import Vapor
import Crypto
#endif
#endif

extension API {

#if canImport(Vapor)
#if canImport(Crypto)
    
    func post<T:Codable>(_ type: T.Type, endpoint: EndpointControler, payload: any Content) throws -> EventLoopFuture<T>{
        
        return getWaWebTokens(
            app: application,
            waWebAccount: profile.waWebAccount,
            instanceId: profile.instanceId
        ).flatMap { token in
            
            guard let token else {
                return application.eventLoop.future(error: TCErrors.generalError(error: "Token"))
            }
            
            var header = HTTPHeaders([
                ("Accept", "application/json"),
                ("token", "\(token.token)"),
                ("instanceid", profile.instanceId)
            ])
            
            if let secretPassword = token.secret?.data(using: .utf8) {
                
                let key = SymmetricKey(data: secretPassword)
                
                //let hkdfResultKey = HKDF<SHA256>.deriveKey(inputKeyMaterial: key, outputByteCount: 151) // Mark 2
                
                do {
                    
                    let trustfulMessage = try JSONEncoder().encode(payload)
                    
                    //let authenticationCode = HMAC<SHA256>.authenticationCode(for: trustfulMessage, using: hkdfResultKey) // Mark 2
                    
                    let authenticationCode = HMAC<SHA256>.authenticationCode(for: trustfulMessage, using: key) // Mark 2
                    
                    header.add(name: "x-wawebapi-hmac", value: authenticationCode.hex)

                    print("token.secret \(token.secret)")
                    print("x-wawebapi-hmac \(authenticationCode.hex)")
                    if let message = String(data: trustfulMessage, encoding: .utf8) {
                        print("message")
                        print(message)
                    }
                }
                catch { }
                
            }
            
            var path = endpoint.path
            
            switch endpoint {
            case .call(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .chat(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .client(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .contact(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .groop(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .label(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .message(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .poll(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .privateChat(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .reaction(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            }
            
            let url = URI(
                scheme: "https",
                host: "intratc.co",
                path: "node/whatsapp/api/v1/\(path)"
            )
            
            print(url.description)
            
            var PAYLOAD = "EMPTY_PAYLOAD"
            
            do {
                let data = try JSONEncoder().encode(payload)
                if let json = String(data: data, encoding: .utf8) {
                    PAYLOAD = json
                }
            }
            catch { }
            
            return application.client.post(url, headers: header){ post in
                try? post.content.encode(payload)
            }.flatMapThrowing { response in
                
                var RESPONSE_BODY = "EMPTY_BODY"
                
                if let buffer = response.body {
                    RESPONSE_BODY = String(buffer: buffer)
                }
                
                print(url.description)
                
                print(RESPONSE_BODY)
                
                do{
                    return try response.content.decode(T.self, using: JSONDecoder())
                }
                catch {
                    
                    print("🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴")
                    
                    print(error)
                    
                    throw TCErrors.generalError(
                        error: "ERROR:\n\(String(describing: error))\n\n" +
                        "URL: \(url.description)\n\n" +
                        "PAYLOAD: \(PAYLOAD)\n\n" +
                        "RESPONSE_BODY: \(RESPONSE_BODY)"
                    )
                    
                }
            }
            .flatMapError { error in
                
                print("🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  ")
                
                print(error)
                
                return application.eventLoop.future(error: TCErrors.generalError(
                    error: "ERROR:\n\(String(describing: error))\n\n" +
                    "URL: \(url.description)\n\n" +
                    "PAYLOAD: \(PAYLOAD)\n\n" +
                    "ERROR:\n\(String(describing: error))"
                ))
                
            }
        }
    }
    
    func post<T:Codable>(_ type: T.Type, endpoint: EndpointControler) throws -> EventLoopFuture<T>{
        
        return getWaWebTokens(
            app: application,
            waWebAccount: profile.waWebAccount,
            instanceId: profile.instanceId
        ).flatMap { token in
            
            guard let token else {
                return application.eventLoop.future(error: TCErrors.generalError(error: "Token"))
            }
            
            let header = HTTPHeaders([
                ("Accept", "application/json"),
                ("token", "\(token.token)"),
                ("instanceid", profile.instanceId)
            ])
            
            var path = endpoint.path
            
            switch endpoint {
            case .call(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .chat(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .client(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .contact(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .groop(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .label(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .message(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .poll(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .privateChat(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .reaction(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            }
            
            let url = URI(
                scheme: "https",
                host: "intratc.co",
                path: "node/whatsapp/api/v1/\(path)"
            )
            
            print(url.description)
            
            return application.client.post(url, headers: header).flatMapThrowing { response in
                
                var RESPONSE_BODY = "EMPTY_BODY"
                
                if let buffer = response.body {
                    RESPONSE_BODY = String(buffer: buffer)
                }
                
                print(RESPONSE_BODY)
                
                do{
                    return try response.content.decode(T.self, using: JSONDecoder())
                }
                catch {
                    
                    print(error)
                    
                    throw TCErrors.generalError(
                        error: "ERROR:\n\(String(describing: error))\n\n" +
                        "URL: \(url.description)\n\n" +
                        "PAYLOAD: NO_PAYLOAD\n\n" +
                        "RESPONSE_BODY: \(RESPONSE_BODY)"
                    )
                    
                }
            }
        }
        
    }
    
    func post( endpoint: EndpointControler) throws -> EventLoopFuture<APIResponse>{
    
        return getWaWebTokens(
            app: application,
            waWebAccount: profile.waWebAccount,
            instanceId: profile.instanceId
        ).flatMap { token in
            
            guard let token else {
                return application.eventLoop.future(error: TCErrors.generalError(error: "Token"))
            }
            
            let header = HTTPHeaders([
                ("Accept", "application/json"),
                ("token", "\(token.token)"),
                ("instanceid", profile.instanceId)
            ])
            
            var path = endpoint.path
            
            switch endpoint {
            case .call(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .chat(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .client(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .contact(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .groop(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .label(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .message(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .poll(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .privateChat(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            case .reaction(let string):
                if !string.isEmpty {
                    path += "/\(string)"
                }
            }
            
            let url = URI(
                scheme: "https",
                host: "intratc.co",
                path: "node/whatsapp/api/v1/\(path)"
            )
            
            print(url.description)
            
            return application.client.post(url, headers: header).flatMapThrowing { response in
                
                do{
                    return try response.content.decode(APIResponse.self, using: JSONDecoder())
                }
                catch {
                    
                    print(error)
                    
                    throw TCErrors.generalError(
                        error: "ERROR:\n\(String(describing: error))\n\n" +
                        "URL: \(url.description)\n\n" +
                        "PAYLOAD: NO_PAYLOAD"
                    )
                    
                }
            }
        }
    }
    
#endif
#endif
    
}
