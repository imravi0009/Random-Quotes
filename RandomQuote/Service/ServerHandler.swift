//
//  ServerHandler.swift
//  RandomQuote
//
//  Created by Ravi kumar on 08/08/20.
//  Copyright © 2020 Ravi kumar. All rights reserved.
//

import Foundation

class ServerHandler {
    func fetchRandomQuote(completonHandler: @escaping([String:String]?,Error?)->Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let url = URL(string: "http://programming-quotes-api.herokuapp.com/quotes/random")!
        let task = session.dataTask(with: url) { data, response, err in
            
            // ensuring there is no error for this HTTP response
            guard err == nil else {
                print ("error: \(err!)")
                completonHandler(nil,err)
                return
            }
            
            // ensuring there is data returned from this HTTP response
            guard let content = data else { return}
            
            // serialise the data / NSData object into Dictionary [String : Any]
            do{
                let json = (try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: String]
                completonHandler(json,nil)
            }
            catch{
                completonHandler(nil,error)
            }
            
        }
        
        task.resume()
    }
}
