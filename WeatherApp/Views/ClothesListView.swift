//
//  ClothesListView.swift
//  WeatherApp
//
//  Created by Suzanne Tian on 2022-05-07.
//

import SwiftUI

struct ClothesListView: View {
    // MARK: Stored properties
    // Stores the entire list of items we could make matches from
    let possibleItems: [ClothingItem]
    
    // MARK: Computed properties
    
    // Return a shorter list that has only items that should be worn in this weather
    var itemsAppropriateForWeather: [ClothingItem] {
        
        var itemsToShow: [ClothingItem] = []
        
        for item in possibleItems {
            itemsToShow.append(item)
        }
        
        return itemsToShow
    }
    
    var body: some View {
        
        List(itemsAppropriateForWeather) { currentItem in
            Image(currentItem.image)
                .resizable()
                .scaledToFit()

        }

    }
}

struct ClothesListView_Previews: PreviewProvider {
    static var previews: some View {
        ClothesListView(possibleItems: testClothingItems)
    }
}
