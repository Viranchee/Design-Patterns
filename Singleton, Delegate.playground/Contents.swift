import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let rect = UIView()
    let label = UILabel()
    let button = UIButton()
    
    var delegate: WeatherProvider? = nil
    
    override func viewDidLoad() {
        delegate = YahooWeather(city: "Mumbai")
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        rect.frame = CGRect(x: 50, y: 70, width: 100, height: 100)
        rect.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 40)
        label.text = "Hello World!"
        label.textColor = .black
        
        button.frame = CGRect(x: 150, y: 400, width: 200, height: 20)
        button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        button.setTitle("Hello", for: .normal)
        
        view.addSubview(rect)
        view.addSubview(label)
        view.addSubview(button)
        
        get_Weather()
    }
    
    func get_Weather() {
        let weather = delegate?.temprature
        label.text = "Current temp: \(weather ?? Temperature(100))"
    }
    
    func get_Forecast() {
        let forecast = delegate?.get_Forecast(for_Days: 5)
        print(forecast!)
        label.text = "Forecast: \(forecast![0]), \(forecast![1])"
    }
    
    func changeDelegate(to_Delegate: WeatherProvider) {
        delegate = to_Delegate
    }
    
}

let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 768, height: 1024)
PlaygroundPage.current.liveView = vc

vc.get_Forecast()

vc.changeDelegate(to_Delegate: OpenWeather(city: "Tokyo"))

vc.get_Forecast()





print(isKnownUniquelyReferenced(&BluetoothProvider.shared))

var anotherReference = BluetoothProvider.shared

print(isKnownUniquelyReferenced(&anotherReference))

print(isKnownUniquelyReferenced(&BluetoothProvider.shared))

