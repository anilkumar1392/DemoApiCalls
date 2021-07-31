//
//  ImageLoader.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

class ImageLoader: NewsImageDataLoader {
    private final class Task: NewsImageDataLoaderTask {
        func cancel() {
            print("Cancel pressed")
        }
    }
    func loadImageData(from url: URL, completion: @escaping (NewsImageDataLoader.Result) -> Void) -> NewsImageDataLoaderTask {
        print("Download image")
        return Task()
    }
}
