//
//  File.swift
//  
//
//  Created by Benjamin Sova on 8/5/20.
//

import Foundation

public protocol PrefixSuffix {
    associatedtype Pieces
    
    func hasPrefix(_ prefix: Pieces) -> Bool
    func hasSuffix(_ suffix: Pieces) -> Bool
    
    func prefixedWith(_ prefix: Pieces) -> Self
    func suffixedWith(_ suffix: Pieces) -> Self
    
    func commonPrefix(_ other: Self) -> Pieces
    func commonSuffix(_ other: Self) -> Pieces
    
    func getPrefix(_ length: Int) -> Self
    func getSuffix(_ length: Int) -> Self
}

extension String: PrefixSuffix {
    public func commonPrefix(_ other: String) -> String {
        return self.commonPrefix(with: other)
    }
    
    public func hasSuffix(_ suffix: String) -> Bool {
        return self.commonSuffix(suffix) == suffix
    }
    
    public func hasPrefix(_ prefix: String) -> Bool {
        return self.commonPrefix(with: prefix) == prefix
    }
    
    public func prefixedWith(_ prefix: String) -> String {
        return prefix + self
    }
    
    public func suffixedWith(_ suffix: String) -> String {
        return self + suffix
    }
    
    public func commonSuffix(_ other: String) -> String {
        return repeatUntil { (index, suffix) -> (Bool, String) in
            if index == count || index == other.count {
                return (true, suffix ?? "")
            }
            if other.getSuffix(index) == self.getSuffix(index) {
                return (false, other.getSuffix(index))
            }
            return (true, suffix ?? "")
        }.outputs.last ?? ""
    }
    
    public func getPrefix(_ prefix: Int) -> String {
        return String(self.prefix(prefix))
    }
    
    public func getSuffix(_ suffix: Int) -> String {
        return String(self.suffix(suffix))
    }
    
    
}
