//
//  NewsImageDataLoader.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

public protocol NewsImageDataLoaderTask {
    func cancel()
}

public protocol NewsImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    
    func loadImageData(from url: String, completion: @escaping (Result) -> Void) -> NewsImageDataLoaderTask
}
