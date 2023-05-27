//
//  SearchViewModel.swift
//  Gen C Task
//
//  Created by Amr Fawaz on 24/05/2023.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    var cars: [Car] = []
}

extension SearchViewModel {
    
    func getCars() -> [Car] {
        do {
            let response = try StaticJsonMapper.decode(file: "Cars_Success", type: CarResponseObject.self)
            cars = response.cars ?? []
        } catch {
            print(error.localizedDescription)
        }
        return cars
    }
    
    func filter(text: String) -> [Car] {
        if text.isEmpty {
            return cars
        }
        let filteredCars = cars.filter( { ($0.color?.lowercased() ?? "").contains(text.lowercased()) ||
            ($0.unitPrice?.lowercased() ?? "").contains(text.lowercased())
        })
        return filteredCars
    }
}
