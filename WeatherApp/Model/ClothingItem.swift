//
//  ClothingItem.swift
//  WeatherApp
//
//  Created by Suzanne Tian on 2022-05-11.
//

import Foundation

struct ClothingItem: Identifiable, Codable {
    
    // MARK: Stored properties
    let image: String
    let minTemp: Double
    let maxTemp: Double
    
    let goodForClear: Bool
    let goodForWind: Bool
    let goodForRain: Bool
    let goodForSnow: Bool
    
    let bestForThisActivity: String
    
    let id: Int
    
}

let testClothingItem = ClothingItem (image: "gloves",
      minTemp: -25,
      maxTemp: 0,
      goodForClear: false,
      goodForWind: true,
      goodForRain: false,
      goodForSnow: true,
      bestForThisActivity: "oe",
      id: 2)

let testClothingItems = [
    
    ClothingItem (image: "gloves",
          minTemp: -25,
          maxTemp: 0,
          goodForClear: false,
          goodForWind: true,
          goodForRain: false,
          goodForSnow: true,
          bestForThisActivity: "oe",
          id: 2)
    ,
    
    ClothingItem ( image: "hat",
          minTemp: 10,
          maxTemp: 40,
          goodForClear: true,
          goodForWind: true,
          goodForRain: false,
          goodForSnow: false,
          bestForThisActivity: "canoe",
          id: 3)
    ,
    ClothingItem (image: "jacket",
          minTemp: 0,
          maxTemp: 15,
          goodForClear: true,
          goodForWind: true,
          goodForRain: false,
          goodForSnow: false,
          bestForThisActivity: "daily",
          id: 4)
    ,
    ClothingItem (image: "long-sleeve",
          minTemp: 15,
          maxTemp: 25,
          goodForClear: true,
          goodForWind: true,
          goodForRain: false,
          goodForSnow: false,
          bestForThisActivity: "daily",
          id: 5)
    ,
    
]

