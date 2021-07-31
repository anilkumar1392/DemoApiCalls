//
//  HeadlinesComposer.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation
import UIKit

final class HeadlineComposer {
    private init() {}
    public static func headlinesComposedWith() -> NewsHeadlinesVC {
        let vc = NewsHeadlinesVC.make()
        return vc
    }
}

private extension NewsHeadlinesVC {
    static func make() -> NewsHeadlinesVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let headlinesVC = storyboard.instantiateViewController(withIdentifier: "NewsHeadlinesVC") as! NewsHeadlinesVC
        return headlinesVC
    }
}
