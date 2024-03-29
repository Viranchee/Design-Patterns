import Foundation

/// Functions
public func square(number: Float) -> Float {
    return number * number
}

public func pi() -> Float {
    return 3.141592653
}

public func increment(number: Int) -> Int {
    return number + 1
}

public func radius_From(diameter: Float) -> Float {
    return diameter / 2
}

// SpawnFacade
/// Facade
public func facade_Calculate_Area_From(_ diameter: Float) -> Float{
    /// Formula = Pi * Radius squared
    
    let radius = radius_From(diameter: diameter)
    let squared_Radius = square(number: radius)
    let area = pi() * squared_Radius
    
    return area
}
