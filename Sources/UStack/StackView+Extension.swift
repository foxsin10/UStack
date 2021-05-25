#if canImport(UIKit)
import UIKit
public typealias LayoutConstraint = NSLayoutConstraint
#elseif canImport(AppKit)
import AppKit
public typealias LayoutConstraint = NSLayoutConstraint
#endif

public extension StackView {
    #if canImport(UIKit)
     convenience init(axis: LayoutConstraint.Axis = .horizontal,
                     spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> View) {
        self.init(arrangedSubviews: views().subviews)
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = axis
    }
    #elseif canImport(AppKit)
    convenience init(axis: NSUserInterfaceLayoutOrientation = .horizontal,
                     spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: NSLayoutConstraint.Attribute = .centerY,
                     @ViewStackBuilder views: () -> View) {
        self.init(views: views().subviews)
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.orientation = axis
    }
    #endif
}

final public class VStack: StackView {}
public extension VStack {
    #if canImport(UIKit)
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> View) {
        self.init(arrangedSubviews: views().subviews)
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = .vertical
    }
    #elseif canImport(AppKit)
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: NSLayoutConstraint.Attribute = .leading,
                     @ViewStackBuilder views: () -> View) {
        self.init(views: views().subviews)
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.orientation = .vertical
    }
    #endif
}

final public class HStack: StackView {}
public extension HStack {
    #if canImport(UIKit)
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> View) {
        self.init(arrangedSubviews: views().subviews)
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = .horizontal
    }
    #elseif canImport(AppKit)
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: NSLayoutConstraint.Attribute = .centerY,
                     @ViewStackBuilder views: () -> View) {
        self.init(views: views().subviews)
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.orientation = .horizontal
    }
    #endif
}
