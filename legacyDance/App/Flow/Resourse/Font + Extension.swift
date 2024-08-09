//
//  Font + Extension.swift

import Foundation
import UIKit
import SwiftUI

extension UIFont {
    
    enum CustomFonts: String {
        case ubuntuMono = "UbuntuMono"
        case unifrakturCook = "UnifrakturCook"
        case mac = "MacondoSwashCaps"
    }
    
    enum CustomFontStyle: String {
        case regular = "-Regular"
        case bold = "-Bold"
    }
    
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: Int,
        isScaled: Bool = true) -> UIFont {
            
            let fontName: String = font.rawValue + style.rawValue
            
            guard let font = UIFont(name: fontName, size: CGFloat(size)) else {
                debugPrint("Font can't be loaded")
                return UIFont.systemFont(ofSize: CGFloat(size))
            }
            
            return isScaled ? UIFontMetrics.default.scaledFont(for: font) : font
        }
}

extension UILabel {
    static func createLabel(withText text: String, font: UIFont, textColor: UIColor, paragraphSpacing: CGFloat, lineHeightMultiple: CGFloat, kern: CGFloat, textAlignment: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = textAlignment
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor,
            .paragraphStyle: paragraphStyle,
            .kern: kern
        ]
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        label.attributedText = attributedString
        
        return label
    }
}

extension UIButton {
    func configureButton(withTitle title: String, font: UIFont, titleColor: UIColor, normalImage: UIImage?, highlightedImage: UIImage?) {
        self.setBackgroundImage(normalImage, for: .normal)
        self.setBackgroundImage(highlightedImage, for: .highlighted)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .center

    }
}

extension Double {
    var autoSize: CGFloat {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let statusBarOrientation = windowScene.interfaceOrientation
            let screenSize = UIScreen.main.bounds.size
            let referenceSize: CGFloat = 852
            let screenSizeOrientation = statusBarOrientation.isPortrait ? screenSize.height : screenSize.width // Изменение ориентации
            let maxAspectRatio = screenSizeOrientation / referenceSize
            
            return CGFloat(self) * maxAspectRatio // Приведение типа
        }
        return CGFloat(self) // Приведение типа
    }

    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        
        return (self * divisor).rounded() / divisor
    }
    
    func formatNumber(_ number: Double) -> String {
        let formattedNumber = String(format: "%.0f", number)
        return formattedNumber
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
    
    func readPosition(onChange: @escaping (CGRect) -> Void) -> some View {
        background(alignment: .center) {
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: PositionPreferenceKey.self, value: geometryProxy.frame(in: .global))
            }
        }
        .onPreferenceChange(PositionPreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

private struct PositionPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}

extension View {
    func backgroundImage(image: ImageResource, blur: CGFloat = 0) -> some View {
        ZStack {
            Rectangle().fill(.clear)
                .background {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .blur(radius: blur)
                }
                .ignoresSafeArea(.keyboard)
            self
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}
