//
//  ViewModel.swift
//  MVVM_MovieApp
//
//  Created by Juma on 8/31/21.
//

import Foundation


class ViewModel {


    var dataSource = MovieModel()
    var didgetDataViewModel: (()->())?
    var error: Error?
    func didgetData() {
        APIHandler.shared.didReceiveDataAPIhandler = { data,error in
            guard let DATA = data else {return}
            let jsondecoder = JSONDecoder()
            do {
                self.dataSource = try! jsondecoder.decode(MovieModel.self, from: DATA)
            } catch {
                print("error \(error) ")
            }
            
            self.didgetDataViewModel?()
        }
        APIHandler.shared.provideData()
    }
    
    
}

