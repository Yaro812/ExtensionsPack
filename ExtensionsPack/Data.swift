//
//  Data.swift
//
//  Created by Yaroslav Pasternak on 31.03.17.

import Foundation

public extension Data {
   public var hexString: String {
        return map { String(format: "%02x", $0) }.joined()
    }
    
   public init(hex: String) {
        var hex = hex
        // in case there is odd number of bytes (it may happen if we use String(int, radix: 16) )
        // we need to add 0 in front of the string
        if hex.count % 2 != 0 { hex = "0" + hex }

        let scalars = hex.unicodeScalars
        var bytes: [UInt8] = [UInt8](repeating: 0, count: (scalars.count + 1) >> 1)
        for (index, scalar) in scalars.enumerated() {
            var nibble = scalar.hexNibble
            if index & 1 == 0 {
                nibble <<= 4
            }
            bytes[index >> 1] |= nibble
        }
        self = Data(bytes: bytes)
    }
}

public extension Data {
   public func scanValue<T: FixedWidthInteger>(at index: Data.Index = 0, endianess: Endianness = .littleEndian) -> T {
        let number: T = self.subdata(in: index..<index + MemoryLayout<T>.size).withUnsafeBytes({ $0.pointee })
        switch endianess {
        case .bigEndian:
            return number.bigEndian
        case .littleEndian:
            return number.littleEndian
        }
    }

    public enum Endianness {
        case bigEndian
        case littleEndian
    }
}

public extension UnicodeScalar {
    var hexNibble: UInt8 {
        let value = self.value
        if 48 <= value && value <= 57 {
            return UInt8(value - 48)
        } else if 65 <= value && value <= 70 {
            return UInt8(value - 55)
        } else if 97 <= value && value <= 102 {
            return UInt8(value - 87)
        }
        fatalError("\(self) not a legal hex nibble")
    }
}
