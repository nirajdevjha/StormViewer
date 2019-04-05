//
//  ViewController.swift
//  StormViewer
//
//  Created by Niraj Jha on 26/03/19.
//  Copyright © 2019 Niraj Jha. All rights reserved.
//

import UIKit


class ImageListViewController: UITableViewController {
    
    var pictures = [String]()

    
     // MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            let fileManager = FileManager.default
            let path = Bundle.main.resourcePath!
            let items = try! fileManager.contentsOfDirectory(atPath: path)
            
            for item in items {
                if item.hasPrefix("nssl") {
                    // this is a picture to load..
                    DispatchQueue.main.async { [weak self] in
                        self?.pictures.append(item)
                        self?.tableView.reloadData()
                    }
                   
                }
            }
        }
    }
        
    
}

extension ImageListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let sb = UIStoryboard(name: "Main", bundle: nil)
        //we have Main Storyboard by default as storyboard
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

