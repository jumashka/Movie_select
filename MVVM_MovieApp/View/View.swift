//
//  ViewController.swift
//  MVVM_MovieApp
//
//  Created by Juma on 8/31/21.
//

import UIKit

class View: UIViewController {


    @IBOutlet weak var tblview: UITableView!
    
    let vm = ViewModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "ModelTableViewCell", bundle: nil)
        tblview.register(nib, forCellReuseIdentifier: "ModelTableViewCell")

        
        tblview.delegate = self
        tblview.dataSource = self
        
        vm.didgetDataViewModel = {
            DispatchQueue.main.async {
                self.tblview.reloadData()
            }
        }
        vm.didgetData()
    }
}





extension View: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.dataSource.results?.count ?? 0
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblview.dequeueReusableCell(withIdentifier: "ModelTableViewCell") as? ModelTableViewCell
            
        cell?.titlelbl.text = vm.dataSource.results?[indexPath.row].original_title
        if let pp = vm.dataSource.results?[indexPath.row].popularity { cell?.poplaritylbl.text = "\(pp)" }
        cell?.releaselbl.text = vm.dataSource.results?[indexPath.row].release_date
        
        if let imageUrl = URL.init(string: Constant.imagData + ((vm.dataSource.results?[indexPath.row].backdrop_path)!)) {
                let data = try? Data(contentsOf: imageUrl)
                if let dataB = data {
                    DispatchQueue.main.async {
                        cell?.imag.image = UIImage(data: dataB)
                    }
                }
            }
        
        

        return cell ?? UITableViewCell()
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(160)
    }
    
    
    
    
    
}

