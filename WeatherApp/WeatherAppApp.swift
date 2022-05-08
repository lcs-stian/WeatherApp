//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Suzanne Tian on 2022-05-07.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                
                TemperatureView()
                    .tabItem {
                        Image(systemName: "thermometer")
                        Text("Temperature")
                    }
                
                ClothesListView()
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("List")
                    }
                
                ClothesDetailView()
                    .tabItem {
                        Image(systemName: "tshirt")
                        Text("Detail")
                    }
                
            }
        }
    }
}
