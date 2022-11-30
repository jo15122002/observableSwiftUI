//
//  Downloader.swift
//  Observable
//
//  Created by digital on 30/11/2022.
//

import Foundation
import UIKit

class Downloader:ObservableObject{
    
    @Published var monImage:UIImage = UIImage();
    
    func downloadImage(urlString:String){
        if let url = URL(string: urlString){
            getData(from: url){data, res, err in
                if let d = data, let image = UIImage(data: d){
                    DispatchQueue.main.async {
                        self.monImage = image
                    }
                }
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()){
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
