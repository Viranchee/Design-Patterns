import Foundation

/// #define Temperature Int
public typealias Temperature = Int

/// Interface = Protocols in Swift
public protocol WeatherProvider {
    
    var city: String { get }
    var temprature: Temperature { get }
    
    init(city: String)
    
    func get_Forecast(for_Days: Int) -> [Temperature]
    
    mutating func update_City(new_City: String)
}

public struct YahooWeather: WeatherProvider {
    
    public private(set) var city: String
    public var temprature: Int {
        get {
            return MockDataProvider().mockTemp()
        }
    }
    
    public init(city: String) {
        self.city = city
    }
    
    public func get_Forecast(for_Days: Int) -> [Temperature] {
        return MockDataProvider().mockForecast(days: for_Days)
    }
    
    public mutating func update_City(new_City: String) {
        city = new_City
    }
}

public struct MockDataProvider {
    
    let minTemperature: Temperature
    let maxTemperature: Temperature
    
    public func mockTemp() -> Temperature {
        return Temperature.random(in: minTemperature...maxTemperature)
    }
    public init(min: Temperature = 8, max: Temperature = 40) {
        self.minTemperature = min
        self.maxTemperature = max
    }
    
    public func mockForecast(days: Int) -> [Temperature] {
        
        var data: [Temperature] = []
        for _ in 0...days {
            data.append(mockTemp())
        }
        return data
    }
    
}

public struct OpenWeather: WeatherProvider {
    
    public private(set) var city: String
    public var temprature: Int {
        get {
            return MockDataProvider(min: -20, max: 5).mockTemp()
        }
    }
    
    public init(city: String) {
        self.city = city
    }
    
    public func get_Forecast(for_Days: Int) -> [Temperature] {
        return MockDataProvider(min: -20, max: 5).mockForecast(days: for_Days)
    }
    
    public mutating func update_City(new_City: String) {
        city = new_City
    }
}
