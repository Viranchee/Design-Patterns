import UIKit

/// Object / Product

public enum Processor {
    case i3
    case i5
    case i7
}

public enum MacType {
    case macbook
    case macbook_pro
    case macbook_air
    
    case iMac
    case iMac_pro
    
    case mac_mini
    case mac_pro
}

public enum Accessory {
    case trackpad
    case pen
    case headphones
    case usbC_To_Hdmi
}

public struct Mac {
    
    let processor: Processor
    let frequency_GHz: Float
    let ram_GB: Int
    let type: MacType
    let accessories: [Accessory]
    /// A Mackintosh computer
    ///
    /// - Parameters:
    ///   - type: Type of Mac
    ///   - processor: Intel processor
    ///   - frequency: CPU core Frequency, in GHz
    ///   - ram: RAM of the Mac, in GBs
    public init(type: MacType, processor: Processor, frequency: Float, ram: Int, accessories: [Accessory]) {
        
        self.type = type
        self.processor = processor
        self.frequency_GHz = frequency
        self.ram_GB = ram
        self.accessories = accessories
    }
}

/// Builder
public class MacBuilder {
    
    /// MARK: - Properties
    public private(set) var processor: Processor
    public private(set) var frequency_GHz: Float
    public private(set) var ram_GB: Int
    public private(set) var type: MacType
    public private(set) var accessories: [Accessory]
    
    /// MARK: - Initializers
    public init(type: MacType,
         processor: Processor,
         frequency: Float,
         ram: Int) {
        self.type = type
        self.processor = processor
        self.frequency_GHz = frequency
        self.ram_GB = ram
        self.accessories = []
    }
    
    public convenience init() {
        self.init(type: .macbook, processor: .i3, frequency: 2.5, ram: 8)
    }
    
    /// MARK: - Methods
    public func change_Processor(new_Processor: Processor) {
        processor = new_Processor
    }
    
    public func change_Frequency(new_Frequency: Float) {
        
        frequency_GHz = new_Frequency
    }
    
    
    public func change_Ram(new_ram: Int) {
        ram_GB = new_ram
    }
    
    public func change_Type(new_type: MacType) {
        type = new_type
    }
    
    public func addAccessory(accessory: Accessory) {
        accessories.append(accessory)
    }
    
    /// MARK: BUILD Functionality
    public func build() -> Mac {
        return Mac(type: type,
                   processor: processor,
                   frequency: frequency_GHz,
                   ram: ram_GB,
                   accessories: accessories)
    }
}

/// MARK: - Director
public class Student {
    public init() { }
    public func create_Portable_Mac() -> Mac {
        let builder = MacBuilder()
        builder.change_Type(new_type: .macbook_air)
        return builder.build()
    }
    
    public func create_Designer_Mac() -> Mac {
        let builder = MacBuilder()
        builder.change_Type(new_type: .iMac)
        builder.addAccessory(accessory: .trackpad)
        builder.addAccessory(accessory: .headphones)
        return builder.build()
    }
    
    public func create_Powerful_Mac() -> Mac {
        let builder = MacBuilder()
        builder.change_Type(new_type: .macbook_pro)
        builder.change_Ram(new_ram: 32)
        builder.change_Frequency(new_Frequency: 4.0)
        builder.change_Processor(new_Processor: .i7)
        
        builder.addAccessory(accessory: .usbC_To_Hdmi)
        
        return builder.build()
    }
}

/// MARK: - Implementation of Builder

public func builder_Build_Finest_Mac() -> Mac {
    let student = Student()
    return student.create_Powerful_Mac()
    
}
