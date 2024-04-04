//
//  MessageMedia.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
/// new MessageMedia(mimetype, data, filename, filesize)
public struct MessageMedia: Codable {
    
    private enum CodingKeys:String, CodingKey {
        case data
        case fileName = "filename"
        case fileSize = "filesize"
        case mimeType = "mimetype"
    }
    
    public let data: String
    
    public let fileName: String?
    
    public let fileSize: Int64?
    
    public let mimeType: FileMimeType
}
