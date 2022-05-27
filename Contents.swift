import UIKit

// String型に対する拡張定義
extension String {
    var isHankaku: Bool {
        for ch in self.unicodeScalars {
            if !(0x20 ..< 0x7F ~= ch.value) { return false }
        }
        return true
    }

    static var zenSpaceDouble: Bool = true

    func toHankaku() -> String {
        var r = ""
        for ch in self.unicodeScalars {
            var v = ch.value
            switch v {
            case 0xFF01 ..< 0xFF5F:
                v -= 0xff01 - 0x21
                r.unicodeScalars.append(Unicode.Scalar(v)!)
            case 0x3000:
                r += String.zenSpaceDouble ? "  " : " "
            default:
                r.unicodeScalars.append(ch)
            }
        }
        return r
    }
}

let zenStr = "１２２００NI"
print(zenStr.isHankaku) //false
print(zenStr.toHankaku()) //12200NI
