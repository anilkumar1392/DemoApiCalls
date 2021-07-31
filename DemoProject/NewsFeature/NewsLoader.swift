//
//  NewsLoader.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

protocol NewsLoader {
    typealias Result = Swift.Result<[Article],Error>
    func load(complition : @escaping (Result) -> Void)
}
