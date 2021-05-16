import UIKit

public extension UIStackView {
     convenience init(axis: NSLayoutConstraint.Axis = .horizontal,
                     spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> UIView) {
        self.init(arrangedSubviews: views().subviews)
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = axis
    }
}

final public class VStack: UIStackView {}
public extension VStack {
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> UIView) {
        self.init(arrangedSubviews: views().subviews)
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = .vertical
    }
}

final public class HStack: UIStackView {}
public extension HStack {
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> UIView) {
        self.init(arrangedSubviews: views().subviews)
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = .horizontal
    }
}
