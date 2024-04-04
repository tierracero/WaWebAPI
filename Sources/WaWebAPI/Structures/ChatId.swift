//
//  ChatId.swift
//
//
//  Created by Victor Cantu on 3/28/24.
//

import Foundation
import TCFoundation

public typealias ChatId = String

extension ChatId {
    
    /// <CC><MOBILE>@c.us
    /// 5214939598000@c.us
    public init(
        cc: Countries,
        mobile: String
    ) {
        if cc == .mexico {
            self = "521\(mobile)@c.us"
        }
        else {
            self = "\(cc.code.toString)\(mobile)@c.us"
        }
    }
    
    /// <GID>@g.us
    /// 120363253982194920@g.us
    public init(
        groop: String
    ) {
        self = "\(groop)@g.us"
    }
    
}
