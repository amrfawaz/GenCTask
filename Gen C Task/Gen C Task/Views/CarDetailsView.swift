//
//  CarDetailsView.swift
//  Gen C Task
//
//  Created by Amr Fawaz on 27/05/2023.
//

import SwiftUI

struct CarDetailsView: View {
    var car: Car
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 4, content: {
                Text("Car Brand: ")
                Text(car.brand ?? "").bold()
            })
            HStack(spacing: 4, content: {
                Text("Car Model: ")
                Text("\(car.model ?? 0)").bold()
            })
            HStack(spacing: 4, content: {
                Text("Car Price: ")
                Text((car.unitPrice ?? "") + (car.currency ?? "")).bold()
            })
            HStack(spacing: 4, content: {
                Text("Plat Number: ")
                Text(car.plateNumber ?? "").bold()
            })
        }
    }
}
