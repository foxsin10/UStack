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
public enum ViewStackBuilder {
    public static func buildExpression(_ expression: View) -> [View] {
        [expression]
    }

    public static func buildExpression(_ expression: View?) -> [View] {
        guard let view = expression else { return [] }
        return [view]
    }

    public static func buildExpression(_ expression: [View]) -> [View] {
        expression
    }

    public static func buildBlock(_ components: [View]...) -> [View] {
        components.flatMap { views -> [View] in
            views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
            return views
        }
    }

    public static func buildOptional(_ component: [View]?) -> [View] {
        guard let view = component else { return [] }
        return view
    }

    public static func buildEither(first component: [View]) -> [View] {
        component
    }

    public static func buildEither(second component: [View]) -> [View] {
        component
    }

    public static func buildLimitedAvailability(_ component: [View]) -> [View] {
        component
    }

    public static func buildFinalResult(_ component: [View]) -> [View] {
        component
    }
}
