#if canImport(UIKit)
import UIKit

@resultBuilder
public enum HStackBuilder {
    public static func buildBlock(_ components: UIView...) -> UIStackView {
        let view = UIStackView(arrangedSubviews: components)
        view.axis = .horizontal
        return view
    }
}

@resultBuilder
public enum VStackBuilder {
    public static func buildBlock(_ components: UIView...) -> UIStackView {
        let view = UIStackView(arrangedSubviews: components)
        view.axis = .vertical
        return view
    }
}

@resultBuilder
public enum ContainerViewBuilder {
    public static func buildBlock(_ components: UIView...) -> UIView {
        let view = UIView()
        components.forEach { view.addSubview($0) }
        return view
    }
}

@resultBuilder
public enum ViewStackBuilder {
    public static func buildBlock(_ components: UIView...) -> [UIView] {
        return components
    }
}

public extension UIView {
    @discardableResult
    func withSubViews(@ViewStackBuilder views: () -> [UIView]) -> UIView {
        views().forEach { self.addSubview($0) }
        return self
    }
}

public extension UIStackView {
     convenience init(axis: NSLayoutConstraint.Axis = .horizontal,
                     spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> [UIView]) {
        self.init(arrangedSubviews: views())
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = axis
    }
}

final public class HStack: UIStackView {}
public extension HStack {
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> [UIView]) {
        self.init(arrangedSubviews: views())
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = .horizontal
    }
}

final public class VStack: UIStackView {}
public extension VStack {
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> [UIView]) {
        self.init(arrangedSubviews: views())
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = .vertical
    }
}
#endif
