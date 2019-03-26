//
//  ViewController.swift
//  StormViewer
//
//  Created by Niraj Jha on 26/03/19.
//  Copyright © 2019 Niraj Jha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load..
                pictures.append(item)
            }
        }
        print(pictures)
    }


}

