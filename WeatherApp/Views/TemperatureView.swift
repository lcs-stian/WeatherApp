//
//  TemperatureView.swift
//  WeatherApp
//
//  Created by Suzanne Tian on 2022-05-07.
//

import SwiftUI

struct TemperatureView: View {
    
    @State private var temperature = 0.0
    
    @State private var isToggleClear : Bool = false
    
    @State private var isToggleWind : Bool = false
    
    @State private var isToggleRain : Bool = false
    
    @State private var isToggleSnow : Bool = false
    
    @State private var selectedActivity = 0
    
    var body: some View {
        
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
                    .padding()
                    Spacer()
                    
                    
                    
                    
                    Picker(selection: $selectedActivity,
                           label: Text("Picker"),
                           content: {
                        
                        Text("Daily").tag(0)
                        Text("OE").tag(1)
                        Text("Swim").tag(2)
                        Text("Canoe").tag(3)
                        
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    Text("Selected activity: \(selectedActivity)")
                    
                    
                    
                    NavigationLink(destination: ClothesListView()) {
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
        
        
        
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
