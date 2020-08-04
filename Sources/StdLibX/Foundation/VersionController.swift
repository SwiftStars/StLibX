//
//  File.swift
//  
//
//  Created by Benjamin Sova on 7/28/20.
//

import Foundation

// MARK: API

public typealias Versioned<Variable> = VersionController<Variable>

@propertyWrapper public struct VersionController<Variable> {
    public var wrappedValue: Variable
    public var projectedValue: Self {
        get {
            self
        } set {
            self = newValue
        }
    }
    
    public typealias Commit = (id: UUID, message: String, at: Variable, time: Date)
    
    public private(set) var history: [Commit]
    public private(set) var fullHistory: [FullHistory]
    
    public init(wrappedValue: Variable, _ message: String? = nil) {
        self.wrappedValue = wrappedValue
        self.history = []
        self.fullHistory = []
        if let message = message {
            self.commit(message)
        }
    }
}

extension VersionController {
    public enum FullHistory {
        case commit(Commit)
        case reset(Commit)
    }
    
    public enum ResetMode {
        case head(Int)
        case origin(Int)
        @available(*, deprecated, message: "Reset to using Commit UUID is unreliable and with sometimes fail.")
        case commit(UUID)
    }
    
    public enum ResetError: Error {
        case noCommitsYet
        case notEnoughCommits((lookedFor: Int, had: Int))
        case cannotFindCommitWithID(UUID)
    }
}

extension VersionController {
    public mutating func commit(_ message: String) {
        let commit = (UUID(), message, wrappedValue, Date())
        history.append(commit)
        fullHistory.append(.commit(commit))
    }
    
    public mutating func reset(_ mode: ResetMode, hard: Bool = false) throws {
        if fullHistory.count == 0 {
            throw ResetError.noCommitsYet
        }
        switch mode {
        case .head(let commits):
            if commits >= history.count - 1 && hard {
                throw ResetError.notEnoughCommits((commits, history.count))
            } else if commits > history.count - 1 {
                throw ResetError.notEnoughCommits((commits, history.count))
            }
            history.removeLast(commits)
            fullHistory.append(.reset(history.last!))
            if hard { wrappedValue = history.last!.at }
        case .origin(let commits):
            if commits >= history.count - 1 && hard {
                throw ResetError.notEnoughCommits((commits, history.count))
            } else if commits > history.count - 1 {
                throw ResetError.notEnoughCommits((commits, history.count))
            }
            history.removeLast(history.count - 1 - commits)
            fullHistory.append(.reset(history.last!))
            if hard { wrappedValue = history.last!.at }
        case .commit(let id):
            let commits = allCommits(fullHistory)
            let inHistory = commits.whereAt(id, at: \.id)
            if let inHistory = inHistory {
                var commits = commits
                commits.removeLast(inHistory - (history.count - 1))
                history = commits
                fullHistory.append(.reset(allCommits(fullHistory)[inHistory]))
                if hard { wrappedValue = history.last!.at }
            } else {
                throw ResetError.cannotFindCommitWithID(id)
            }
        }
    }
}

infix operator <- : AssignmentPrecedence

extension VersionController {
    public static func <- (lhs: inout VersionController, rhs: Variable) {
        lhs.wrappedValue = rhs
    }
    
    public static func <- (lhs: inout VersionController, rhs: (setTo: Variable, message: String)) {
        lhs.wrappedValue = rhs.setTo
        lhs.commit(rhs.message)
    }
}

// MARK: Resources

public func allCommits<T>(_ fullHistory: [VersionController<T>.FullHistory]) -> [VersionController<T>.Commit] {
    fullHistory.compactMap { (history) -> VersionController<T>.Commit? in
        switch history {
        case .commit(let data): return data
        default: return nil
        }
    }
}
