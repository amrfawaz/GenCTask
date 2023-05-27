//
//  Car.swift
//  Gen C Task
//
//  Created by Amr Fawaz on 24/05/2023.
//

import Foundation

struct CarResponseObject: Decodable {
    let status: ResponseStatus?
    let cars: [Car]?
}

struct ResponseStatus: Decodable {
    let code: Int?
    let message: String?
}

struct Car: Decodable, Identifiable {
    let id = UUID()
    let model: Int?
    let plateNumber: String?
    let brand: String?
    let unitPrice: String?
    let currency: String?
    let color: String?    
}
