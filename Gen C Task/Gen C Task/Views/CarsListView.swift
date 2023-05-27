//
//  CarsListView.swift
//  Gen C Task
//
//  Created by Amr Fawaz on 24/05/2023.
//

import SwiftUI

struct CarsListView: View {
    @State private var filteredCars = [Car]()
    @State private var searchText = ""
    
    var viewModel = SearchViewModel()
    var body: some View {
        NavigationView {
            List {
                if filteredCars.isEmpty {
                    Text("there’s no car available with this criteria.")
                } else {
                    ForEach(filteredCars, id: \.id) { car in
                        NavigationLink(destination: CarDetailsView(car: car)) {
                            VStack(alignment: .leading) {
                                Text(car.brand ?? "")
                                    .font(.headline)
                                Text("Price: " + (car.unitPrice ?? ""))
                                Text("Color: " + (car.color ?? ""))
                            }
                        }
                    }
                }
            }
            .navigationTitle("Available Cars")
        }
        .searchable(text: $searchText)
        .onAppear() {
            runSearch()
        }
        .onSubmit(of: .search, runSearch)
        .onChange(of: searchText) { car in
            filteredCars = viewModel.filter(text: car)
        }
    }
    
    func runSearch() {
        filteredCars = viewModel.getCars()
    }
}

struct CarsListView_Previews: PreviewProvider {
    static var previews: some View {
        CarsListView()
    }
}
