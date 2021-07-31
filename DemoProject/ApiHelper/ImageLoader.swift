//
//  ImageLoader.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

class ImageLoader: NewsImageDataLoader {
    var serviceHelper = ServiceHelper()

    private final class Task: NewsImageDataLoaderTask {
        func cancel() {
            print("Cancel pressed")
        }
    }
    
    func loadImageData(from url: String, completion: @escaping (NewsImageDataLoader.Result) -> Void) -> NewsImageDataLoaderTask {
        print("Download image")
        serviceHelper.request(param: [:], methodType: .get, apiName: url) { (result) in
            switch result {
            case .success(let data):
                completion(.success(data as! Data))
            case .failure(let error):
                print("Something went wrong \(error)")
            }
        }
        return Task()
    }
}
