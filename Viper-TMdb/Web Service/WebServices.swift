//
//  WebServices.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

import Foundation

internal enum WebServiceError: Error {
    case badStatus(Int, Data)
    case api(Int, String)
}

private struct Status: Decodable {
    let code: Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code = "status_code"
        case message = "status_message"
    }
}

final internal class WebService {
    
    private let configuration: WebServiceConfiguration
    private let session = URLSession(configuration: .default)
    private let baseURL = URL(string: CONSTANTS.CALLS.BASE_URL)!
    private let decoder = JSONDecoder()
    
    init(configuration: WebServiceConfiguration = .default){
        self.configuration = configuration
    }
    
    func loadGenericFromApi <T: Decodable> (type: T.Type, endpoint: Endpoint, completion : @escaping (T?) -> ()) {
        let decoder = self.decoder
        let request = endpoint.request(with: baseURL, parameters: configuration.parameters)
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let dataDes = data else {return}
            let statusCode = (response as! HTTPURLResponse).statusCode
            print("URL Session Log in Task Succeeded: \(statusCode) -> HTTP")
            if (error == nil) {
                do{
                    let json = try decoder.decode(T.self, from: dataDes)
                    completion(json)
                }catch{
                    // TODO: Do something with errors
                    completion(nil)
                }
            }else {
                print("URL Session Log in Task Failed: %@", error!.localizedDescription);
                completion(nil)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
