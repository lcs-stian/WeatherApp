//
//  ClothesListView.swift
//  WeatherApp
//
//  Created by Suzanne Tian on 2022-05-07.
//

import SwiftUI

struct ClothesListView: View {
    var body: some View {
        
        List {

            Image("hat")
            Image("winter-coat")
            Image("pant")
            
            }

    }
}

struct ClothesListView_Previews: PreviewProvider {
    static var previews: some View {
        ClothesListView()
    }
}
