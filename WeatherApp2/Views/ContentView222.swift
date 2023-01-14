//
//  ContentView.swift
//  WeatherApp2
//
//  Created by Zoran Medic on 07.01.2023..
//
/*
import SwiftUI
import CoreLocation
import WeatherKit

class LocationManager: NSObject, ObservableObject {
    @Published var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last, currentLocation == nil else { return }
        
        DispatchQueue.main.async {
            self.currentLocation = location
        }
    }
}

struct HourlyForecastView: View {
    
    let hourWeatherList: [HourWeather]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Hourly Forecast")
                .font(.caption)
                .opacity(0.5)
            ScrollView(.horizontal){
                HStack{
                    ForEach(hourWeatherList, id: \.date) { hourWeatherItem in
                        VStack(spacing: 20) {
                            Text(hourWeatherItem.date.formatAsAbbreviatedTime())
                            Image(systemName: "\(hourWeatherItem.symbolName).fill")
                                .foregroundColor(.yellow)
                            Text(hourWeatherItem.temperature.formatted())
                        }.padding()
                    }
                }
            }
        }.padding().background{
            Color.blue
        }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .foregroundColor(.white)
    }
    
}

extension Date {
    func formatAsAbbreviatedDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: self)
    }
    func formatAsAbbreviatedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ha"
        return formatter.string(from: self)
    }
}


struct TenDaysForecastView: View {
    
    let dayWeatherList: [DayWeather]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("10-DAY FORECAST")
                .font(.caption)
                .opacity(0.5)
            
            List(dayWeatherList, id: \.date) { dailyWeather in
                HStack {
                    Text(dailyWeather.date.formatAsAbbreviatedDay())
                        .frame(maxWidth: 50, alignment: .leading)
                    Image(systemName: "\(dailyWeather.symbolName).fill")
                        .foregroundColor(.yellow)
                    
                    Text(dailyWeather.lowTemperature.formatted())
                        .frame(maxWidth: .infinity)
                    
                    Text(dailyWeather.highTemperature.formatted())
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }.listRowBackground(Color.blue)
            }.listStyle(.plain)
        }
        .padding()
        .background(content: {
            Color.blue
        })
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        .foregroundColor(.white)
    }
}

struct ContentView: View {
    
    let weatherService = WeatherService.shared
    @StateObject private var locationManager = LocationManager()
    @State private var weather: Weather?
    
    var hourlyWeatherData: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter {
                hourlyWeather in return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(24))
        } else {
            return[]
        }
    }
    
    var body: some View {
        VStack {
            if let weather {
                VStack{
                    Text("Mainz")
                        .font(.largeTitle)
                    Text("\(weather.currentWeather.temperature.formatted())")
                }
                HourlyForecastView(hourWeatherList: hourlyWeatherData)
                Spacer()
                
                TenDaysForecastView(dayWeatherList: weather.dailyForecast.forecast)
            }
        }
        .padding()
        .task(id: locationManager.currentLocation) {
            do {
                //if let location = locationManager.currentLocation {
                let location = CLLocation(latitude: 45, longitude: 16)
                self.weather = try await weatherService.weather(for: location)
                //}
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
