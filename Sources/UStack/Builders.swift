#if canImport(UIKit)
import UIKit
public typealias View = UIView
public typealias StackView = UIStackView
#elseif canImport(AppKit)
import AppKit
public typealias View = NSView
public typealias StackView = NSStackView
#endif

@resultBuilder
public enum HStackBuilder {
    public static func buildBlock(_ components: View...) -> StackView {
        components.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        let view: StackView
        #if canImport(UIKit)
        view = StackView(arrangedSubviews: components)
        view.axis = .horizontal
        #elseif canImport(AppKit)
        view = StackView(views: components)
        view.orientation = .horizontal
        #endif
        return view
    }
}

@resultBuilder
public enum VStackBuilder {
    public static func buildBlock(_ components: View...) -> StackView {
        components.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        let view: StackView
        #if canImport(UIKit)
        view = StackView(arrangedSubviews: components)
        view.axis = .vertical
        #elseif canImport(AppKit)
        view = StackView(views: components)
        view.orientation = .vertical
        #endif
        return view
    }
}

@resultBuilder
public enum ContainerViewBuilder {
    public static func buildBlock(_ components: View...) -> View {
        let view = View()
        components.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        return view
    }
}

@resultBuilder
public enum ViewStackBuilder {
    public static func buildExpression(_ expression: View) -> View {
        expression
    }

    public static func buildBlock(_ components: View...) -> View {
        let count = components.count
        switch count {
        case 1: return components.first ?? View()

        default:
            let view = View()
            components.forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
            return view
        }
    }

    public static func buildOptional(_ component: View?) -> View {
        guard let view = component else {
            return Spacer()
        }
        return view
    }

    public static func buildEither(first component: View) -> View {
        component
    }

    public static func buildEither(second component: View) -> View {
        component
    }
}
