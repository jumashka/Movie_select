//
//  APIHandler.swift
//  MVVM_MovieApp
//
//  Created by Juma on 8/31/21.
//

import Foundation


class APIHandler {
    static let shared = APIHandler.init()
    private init() {}
    var didReceiveDataAPIhandler: ((Data?, Error?)->())?

    
    
    func provideData(url: String = Constant.intAddress) {
        URLSession.shared.dataTask(with: URL.init(string: url)!) { data, response, error in
            self.didReceiveDataAPIhandler?(data,error)
            }.resume()
        
    }
    
    
    
    
}
