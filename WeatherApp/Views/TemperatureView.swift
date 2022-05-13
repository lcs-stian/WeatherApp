//
//  TemperatureView.swift
//  WeatherApp
//
//  Created by Suzanne Tian on 2022-05-07.
//

import SwiftUI

struct TemperatureView: View {
    
    // MARK: Stored properties
        
    // Stores the entire list of items we could make matches from
    @State var possibleItems: [ClothingItem] = []
    
    // Stores an image to show
    @State var currentItem: ClothingItem = testClothingItem
    
    @State private var temperature = 0.0
    
    @State private var isToggleClear : Bool = false
    
    @State private var isToggleWind : Bool = false
    
    @State private var isToggleRain : Bool = false
    
    @State private var isToggleSnow : Bool = false
    
    @State private var selectedActivity = ""
    
    var body: some View {
        // MARK: Computed properties
        NavigationView {
            ScrollView {
                
                VStack{
                    
                    ZStack{
                        
                        Text("\(String(format: "%.f", temperature)) °")
                            .font(.system(size: 60))
                            .bold()
                        
                        
                        Image(systemName: "cloud")
                            .foregroundColor(.blue)
                            .font(.system(size: 200, weight: .thin))
                    }
                    
                    
                    Slider(value: $temperature,
                           in: -25.0...40.0,
                           step: 1,
                           label: {
                        Text("Celsius")
                    },
                           minimumValueLabel: {
                        Text("-25°C")
                    },
                           maximumValueLabel: {
                        Text("40°C")
                    })
                    
                    VStack {
                        HStack{
                            
                            Toggle(isOn: $isToggleClear){
                                Text("Clear")
                                
                            }
                            Toggle(isOn: $isToggleWind){
                                Text("Wind")
                                
                            }
                        }
                        Spacer()
                        
                        HStack{
                            Toggle(isOn: $isToggleRain){
                                Text("Rain")
                                
                            }
                            Toggle(isOn: $isToggleSnow){
                                Text("Snow")
                                
                            }
                        }
                    }
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .padding(30)
                    Spacer()
                    
                    Picker(selection: $selectedActivity,
                           label: Text("Picker"),
                           content: {
                        
                        Text("Daily").tag("daily")
                        Text("OE").tag("oe")
                        Text("Swim").tag("swim")
                        Text("Canoe").tag("canoe")
                        
                    })
                        .pickerStyle(SegmentedPickerStyle())
                    Text("Selected activity: \(selectedActivity)")
                    
                    
                    
                    NavigationLink(destination: ClothesListView(
                        possibleItems: possibleItems,
                        temperature: temperature,
                        isToggleClear: isToggleClear,
                        isToggleWind: isToggleWind,
                        isToggleRain: isToggleRain,
                        isToggleSnow: isToggleSnow
                
                    )) {
                        Text("What should I wear?")
                            .frame(minWidth: 0, maxWidth: 300)
                            .padding()
                            .foregroundColor(.white)
                            .background(.yellow)
                            .cornerRadius(40)
                            .font(.title)
                    }
                    
                }
                .padding()
                .navigationTitle("Title")
            }
            
        }
        
        // This runs as soon as the app opens
        .task {
            loadItemData()
        }
    }
    
    // MARK: Functions
    
    /// Loads data about items to be matched from a JSON file in the app bundle.

    func loadItemData() {
        
        // Get list of items that could be matched from the app bundle
        let url = Bundle.main.url(forResource: "clothing-items", withExtension: "json")!
        
        // Load the contents of the JSON file
        let data = try! Data(contentsOf: url)
        
        // DEBUG: What data was pulled from that file?
        print("Data loaded from JSON file in app bundle had this data...")
        print("===")
        print(String(data: data, encoding: .utf8)!)
        
        // Convert each JSON object into instances of the structure in the list
        possibleItems = try! JSONDecoder().decode([ClothingItem].self, from: data)
        
        // DEBUG: How many items are there in the list now?
        print(dump(possibleItems))
        
        // Pick a random item to show, or if that doesn't work, show the test item
        currentItem = possibleItems.randomElement() ?? testClothingItem
        
    }
    
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
