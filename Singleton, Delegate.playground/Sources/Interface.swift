import Foundation

public typealias Temperature = Int

public protocol WeatherProvider {
    
    var city: String { get }
    var temprature: Temperature { get }
    
    init(city: String)
    
    func get_Forecast(for_Days: Int) -> [Temperature]
    
    mutating func update_City(new_City: String)
}

public struct Weather: WeatherProvider {
    
    
    public private(set) var city: String
    public var temprature: Int {
        get {
            return MockDataProvider().mockTemp
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
    public var mockTemp = Temperature.random(in: 8...40)
    
    public func mockForecast(days: Int) -> [Temperature] {
        
        var data: [Temperature] = []
        for _ in 0...days {
            data.append(mockTemp)
        }
        return data
    }
    
}
