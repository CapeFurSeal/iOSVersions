//
//  WebService.swift
//  iOSVersions
//
//  Created by mac on 2020/12/09.
//

import Foundation
import Combine

class WebService {
    
    static var basePath = "https://yoco-tech-tests.s3-eu-west-1.amazonaws.com/ios/"
    static var jsonExtension = "ios.json"
    fileprivate var baseUrl = URL(string: "\(basePath)\(jsonExtension)")

    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.urlCache = URLCache.shared
        config.waitsForConnectivity = true
        config.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
    }()
    
    private func createPublisher(for url: URL) -> AnyPublisher<IosVersion, Error> {
        return session.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: IosVersion.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func getIosVersions() -> AnyPublisher<(IosVersion), Error>? {
        guard let baseUrl = baseUrl else {
            return nil
        }
        return createPublisher(for: baseUrl)
    }
}
