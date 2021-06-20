//
//  ListViewConroller.swift
//  Lab1-1
//
//  Created by Andrew Kurovskiy on 25.04.2021.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
   
    lazy var jsonMovies = getText("MoviesList")
    lazy var moviesArr:[Movies.Movie] = jsonMovies!.Search
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
         
    }
}

extension ListViewController {
    func getText(_ textName: String) -> Movies? {
        if let filePath = Bundle.main.path(forResource: textName, ofType: "txt") {
            do {
                let text = try String(contentsOfFile: filePath)
                let jsonData = text.data(using: .utf8)!
                let json = try! JSONDecoder().decode(Movies.self, from: jsonData)
                return json
            } catch {
                print("No such file")
            }
        }
        return nil
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = moviesArr[indexPath.row]

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! CustomTableViewCell
        cell.setImageAndLabel(movie: movie)
 
        return cell
    }
    
    
}

