//
//  KinopoiskValuesProvider.swift
//  
//
//  Created by Назар Ткаченко on 10.08.2024.
//

import Foundation

public struct KinopoiskValuesProvider {
    private let repository: KinopoiskRepository

    public init(repository: KinopoiskRepository) {
        self.repository = repository
    }
    
    public func loadPossibleValues(field: String, complete: @escaping (_ data: [PossibleValueModel]?, _ error: Error?) -> Void) {
        repository.getPossibleValues(field: field, completion: complete)
    }
}
