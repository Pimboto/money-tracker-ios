// Path: /ChopTrack/Shared/Extensions/Double+Currency.swift

import Foundation

extension Double {
    func asCurrency(_ currency: Currency) -> String {
        currency.format(self)
    }
    
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    var asPercentage: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self / 100)) ?? "\(Int(self))%"
    }
}
