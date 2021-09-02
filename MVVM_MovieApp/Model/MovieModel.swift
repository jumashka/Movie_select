//
//  MovieModel.swift
//  MVVM_MovieApp
//
//  Created by Juma on 8/31/21.
//

import UIKit

struct MovieModel: Codable {
    var results: [Results]?
    
}

struct Results: Codable {
    var backdrop_path       : String?
    var original_title      : String?
    var popularity          : Double?
    var release_date        : String?
}
