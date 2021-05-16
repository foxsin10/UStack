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
    public static func buildExpression(_ expression: UIView) -> UIView {
        expression
    }

    public static func buildBlock(_ components: UIView...) -> UIView {
        let count = components.count
        switch count {
        case 0: return UIView.spacer()
        case 1: return components.first ?? UIView()

        default:
            let view = UIView()
            components.forEach { view.addSubview($0) }
            return view
        }
    }

    public static func buildOptional(_ component: UIView?) -> UIView {
        guard let view = component else {
            return UIView.spacer()
        }
        return view
    }

    public static func buildEither(first component: UIView) -> UIView {
        component
    }

    public static func buildEither(second component: UIView) -> UIView {
        component
    }
}
