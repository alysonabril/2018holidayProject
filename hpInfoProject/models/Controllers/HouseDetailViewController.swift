//
//  HouseDetailViewController.swift
//  hpInfoProject
//
//  Created by Alyson Abril on 1/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {
    var house: House!
    
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var mascot: UILabel!
    @IBOutlet weak var houseColors: UILabel!
    @IBOutlet weak var values: UILabel!
    @IBOutlet weak var founder: UILabel!
    @IBOutlet weak var headOfHouse: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateHouseInfo () {
        //characterImage.image = image
        houseName.text = house.name
        mascot.text = house.mascot
        //houseColors.text = String(house.colors)
       //e values.text = house.values
        founder.text = house.founder
        headOfHouse.text = house.headOfHouse
        
       
    }
}
