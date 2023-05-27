//
//  StaticJsonMapper.swift
//  Gen C Task
//
//  Created by Amr Fawaz on 24/05/2023.
//

import Foundation

struct StaticJsonMapper {
    static func decode<T: Decodable>(file: String, type: T.Type) throws -> T {
        guard let path = Bundle.main.path(forResource: file, ofType: ".json"),
              let data = FileManager.default.contents(atPath: path) else {
            throw MappingError.failedToGetData
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}


extension StaticJsonMapper {
    enum MappingError: Error {
        case failedToGetData
    }
}
