//
//  Detail.swift
//  StarWarsVOne
//
//  Created by Ghassan  albakuaa  on 10/13/20.
// let name, height, mass, hairColor: String



import UIKit

class Detail: UIViewController , Info {
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var filmsLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var vehiclesLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    
    
    var text = ""
    var birthYear = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            
            self.nameLabel.text = self.text
            self.filmsLabel.text = self.text
            self.speciesLabel.text = self.text
            self.vehiclesLabel.text = self.text
            self.birthYearLabel.text = self.birthYear
            self.skinColorLabel.text = self.text
        }
    }
    func infoTransmitter(text: String, birthYear: String) {
        self.text = text
        self.birthYear = birthYear
        
    }
}
