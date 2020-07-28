//
//  File.swift
//  
//
//  Created by Benjamin Sova on 7/28/20.
//

import Foundation

// MARK: API

public typealias Versioned<Variable> = VersionController<Variable>

public struct VersionController<Variable> {
    public var variable: Variable
    
    public typealias Commit = (id: UUID, message: String, at: Variable, time: Date)
    
    public private(set) var history: [Commit]
    public private(set) var fullHistory: [FullHistory]
    
    public init(_ variable: Variable, _ message: String? = nil) {
        self.variable = variable
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
        let commit = (UUID(), message, variable, Date())
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
            let current = history.last!
            history.removeLast(commits)
            fullHistory.append(.reset(current))
        case .origin(let commits):
            if commits >= history.count - 1 && hard {
                throw ResetError.notEnoughCommits((commits, history.count))
            } else if commits > history.count - 1 {
                throw ResetError.notEnoughCommits((commits, history.count))
            }
            let current = history.last!
            history.removeLast(history.count - 1 - commits)
            fullHistory.append(.reset(current))
        case .commit(let id):
            let commits = fullHistory.allCommits()
            let inHistory = commits.whereAt(id, at: \.id)
            if let inHistory = inHistory {
                var commits = commits
                commits.removeLast(history.count - 1 - inHistory)
                history = commits
                fullHistory.append(.reset(commits[inHistory]))
            } else {
                throw ResetError.cannotFindCommitWithID(id)
            }
        }
    }
}

infix operator <- : AssignmentPrecedence

extension VersionController {
    public static func <- (lhs: inout VersionController, rhs: Variable) {
        lhs.variable = rhs
    }
    
    public static func <- (lhs: inout VersionController, rhs: (setTo: Variable, message: String)) {
        lhs.variable = rhs.setTo
        lhs.commit(rhs.message)
    }
}

// MARK: Resources

extension Array {
    func allCommits<T>() -> [VersionController<T>.Commit] where Element == VersionController<T>.FullHistory {
        compactMap { (history) -> VersionController<T>.Commit? in
            switch history {
            case .commit(let data): return data
            default: return nil
            }
        }
    }
}
