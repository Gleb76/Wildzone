//
//  KinopoiskValuesProvider.swift
//  
//
//  Created by Назар Ткаченко on 10.08.2024.
//

public struct KinopoiskValuesProvider {
    
    public init() {}
    
    mutating public func loadPossibleValues(field: String, complete: @escaping (_ data: [PossibleValueModel]?, _ error: Error?) -> Void) {

        KinopoiskAPI.getPossibleValuesByField(field: field) { data, error in
            complete(data, error)
        }
    }
}
