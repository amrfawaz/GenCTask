//
//  Bundle+Extension.swift
//  Gen C Task
//
//  Created by Amr Fawaz on 27/05/2023.
//

import Foundation
import Combine

extension Bundle{
    func readFile(file: String) -> AnyPublisher<Data, Error> {
        self.url(forResource: file, withExtension: nil)
            .publisher
            .tryMap{ string in
                guard let data = try? Data(contentsOf: string) else {
                    fatalError("Failed to load \(file) from bundle.")
                }
                return data
            }
            .mapError { error in
                return error
            }.eraseToAnyPublisher()
    }
}
