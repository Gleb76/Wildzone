//
//  PossibleValueModel.swift
//
//
//  Created by Назар Ткаченко on 10.08.2024.
//

import Foundation

// MARK: - PossibleValueElement
public struct PossibleValueModel: Codable {
    public let name, slug: String?

    public init(name: String?, slug: String?) {
        self.name = name
        self.slug = slug
    }
}

public typealias PossibleValue = [PossibleValueModel]
