//
//  TemperatureView.swift
//  WeatherApp
//
//  Created by Suzanne Tian on 2022-05-07.
//

import SwiftUI

struct TemperatureView: View {
    
    @State private var temperature = 16
    
    
    var body: some View {
       
        VStack{

            
            Stepper( "Celsius",
                    value: $temperature,
                    in: -10...30,
                    step: 1)
            
            Text("The temperature is \(temperature)°")
                .font(.largeTitle)
                .bold()
            

        }
        .padding()
        
        
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
