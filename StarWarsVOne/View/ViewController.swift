//
//  ViewController.swift
//  StarWarsVOne
//
//  Created by Ghassan  albakuaa  on 10/12/20.
//

import UIKit
protocol Info {
    func infoTransmitter(text: String,  birthYear: String)
}
    
    class ViewController: UIViewController  {
    
   
    @IBOutlet weak var tableView: UITableView!
        var delegation: Info?
        var movies: [Result2] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
       // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        NetworkManager.shared.fetchMovies { (result) in
            switch result {
            case .success(let movies):
                self.movies.append(contentsOf: movies)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }


}

extension ViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as? TableViewCell
        else {
            return UITableViewCell()
        }
      //  self.setImage(cell: cell, imagePath: movies[indexPath.row].posterImage)
    //    cell.movieImageView.image = UIImage(named: "dice1")
        cell.homewould.text = self.movies[indexPath.row].homeworld
        cell.eyeColor.text = self.movies[indexPath.row].eyeColor
        cell.hairColor.text = self.movies[indexPath.row].hairColor
        cell.name.text = self.movies[indexPath.row].name
        cell.birthYear.text = self.movies[indexPath.row].birthYear
        //   cell.films.text = self.movies[indexPath.row].films[indexPath.row]
        return cell
    }
  /*
    func setImage(cell: TableViewCell, imagePath: String) {
          NetworkManager.shared.fetchImage(imagePath: imagePath) { (result) in
                switch result {
                case .success(let image):
                 DispatchQueue.main.async {
                       cell.movieImageView.image = image
                }
    
               case .failure(let error):
                   print(error.localizedDescription)
                  
               }
           }
   
        }
        */
    }
 
extension ViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
        self.delegation = vc as? Info
        let cell = tableView.cellForRow(at: indexPath) as? TableViewCell
      
      guard let text = cell?.name.text else { return }
       guard let birthY = cell?.birthYear.text else { return }
        
     delegation?.infoTransmitter(text: text, birthYear: birthY)
        }

      // self.navigationController?.pushViewController(vc,animated: true)
        
    }


