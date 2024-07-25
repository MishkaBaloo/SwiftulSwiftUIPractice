//
//  SwiftulSwiftUIPracticeApp.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/18/24.
//

import SwiftUI
import SwiftfulRouting

@main
struct SwiftulSwiftUIPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
