//
//  ServiceHelper.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

enum MethodType: String {
    case get = "GET"
    case post = "POST"
}

class ServiceHelper {
    private var session : URLSession
    init(session : URLSession = .shared) {
        self.session = session
    }
    
    func request(param: [String: Any], methodType: MethodType, apiName: String, onComplition: @escaping (Result<Any, Error>) -> Void) {
        guard let urlRequest = URL(string: apiName) else {return}
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil && response != nil && data?.count != 0 {
                onComplition(.success(data as Any))
            } else {
                onComplition(.failure(error!))
            }
        }.resume()
    }
}
