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
        #elseif canImport(AppKit)
        view = StackView(views: components)
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
        #elseif canImport(AppKit)
        view = StackView(views: components)
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

let singleViewTag = "ViewStackBuilder".hashValue ^ "ustack".hashValue

@resultBuilder
public enum ViewStackBuilder {
    public static func buildExpression(_ expression: View) -> View {
        expression
    }

    public static func buildBlock(_ components: View...) -> View {
        let count = components.count
        switch count {
        case 1:
            components.first?.tag = singleViewTag
            return components.first ?? View()

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
