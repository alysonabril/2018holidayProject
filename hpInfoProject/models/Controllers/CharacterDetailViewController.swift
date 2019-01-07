//
//  CharacterDetailViewController.swift
//  hpInfoProject
//
//  Created by Alyson Abril on 1/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterSchool: UILabel!
    @IBOutlet weak var characterHouse: UILabel!
    @IBOutlet weak var bloodStatus: UILabel!
    @IBOutlet weak var characterSpecies: UILabel!
    @IBOutlet weak var characterAffiliation: UILabel!
    
    var person: HPCharacter!
    var image = UIImage.init(named: "hpLogo")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCharacterInfo()
        

    
        
        //view = UIImageView(image: UIImage(named: "parchment")!)
    }
    
    func updateCharacterInfo () {
        characterImage.image = image
        characterName.text = person.name
        characterSchool.text = person.school
        characterHouse.text = person.house
        bloodStatus.text = String("Blood Status: \(person.bloodStatus)")
        characterSpecies.text = String("Species: \(person.species)")
        
        if person.deathEater == true {
            characterAffiliation.text = String("Affiliation: DeathEater")
        } else {
            characterAffiliation.text = String("Affiliation: Order of Phoenix")
        }        
    }
}
