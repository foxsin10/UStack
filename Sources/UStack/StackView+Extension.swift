#if canImport(UIKit)
import UIKit
public typealias LayoutConstraint = NSLayoutConstraint
#elseif canImport(AppKit)
import AppKit
public typealias LayoutConstraint = NSLayoutConstraint
#endif

final public class VStackView: StackView {}
public extension VStackView {
    #if canImport(UIKit)
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> [View]) {
        self.init(arrangedSubviews: views())
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = .vertical
    }
    #elseif canImport(AppKit)
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: NSLayoutConstraint.Attribute = .leading,
                     @ViewStackBuilder views: () -> [View]) {
        self.init(views: views())
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.orientation = .vertical
    }
    #endif
}

final public class HStackView: StackView {}
public extension HStackView {
    #if canImport(UIKit)
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> [View]) {
        self.init(arrangedSubviews: views())
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = .horizontal
    }
    #elseif canImport(AppKit)
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: NSLayoutConstraint.Attribute = .centerY,
                     @ViewStackBuilder views: () -> [View]) {
        self.init(views: views())
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.orientation = .horizontal
    }
    #endif
}
