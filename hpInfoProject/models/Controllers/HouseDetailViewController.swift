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
        updateHouseInfo()
        view.backgroundColor = .black
    }
    
    func updateHouseInfo () {
        
        switch house.name {
        case "Gryffindor":
            houseImage.image = UIImage.init(named: "gryffindor")!
            houseName.textColor = UIColor.init(red: 191/255, green: 19/255, blue: 21/255, alpha: 1)
            mascot.textColor = UIColor.init(red: 212/255, green: 175/255, blue: 55/255, alpha: 1)
            houseColors.textColor = UIColor.init(red: 191/255, green: 19/255, blue: 21/255, alpha: 1)
            values.textColor = UIColor.init(red: 212/255, green: 175/255, blue: 55/255, alpha: 1)
            founder.textColor = UIColor.init(red: 191/255, green: 19/255, blue: 21/255, alpha: 1)
            headOfHouse.textColor = UIColor.init(red: 212/255, green: 175/255, blue: 55/255, alpha: 1)
            
        case "Ravenclaw":
            houseImage.image = UIImage.init(named: "ravenclaw")!
            houseName.textColor = UIColor.init(red: 7/255, green: 49/255, blue: 186/255, alpha: 1)
            mascot.textColor = UIColor.init(red: 205/255, green: 127/255, blue: 50/255, alpha: 1)
            houseColors.textColor = UIColor.init(red: 7/255, green: 49/255, blue: 186/255, alpha: 1)
            values.textColor = UIColor.init(red: 205/255, green: 127/255, blue: 50/255, alpha: 1)
            founder.textColor = UIColor.init(red: 7/255, green: 49/255, blue: 186/255, alpha: 1)
            headOfHouse.textColor = UIColor.init(red: 205/255, green: 127/255, blue: 50/255, alpha: 1)
        case "Slytherin":
            houseImage.image = UIImage.init(named: "slytherin")!
            houseName.textColor = UIColor.init(red: 6/255, green: 114/255, blue: 4/255, alpha: 1)
            mascot.textColor = UIColor.init(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
            houseColors.textColor = UIColor.init(red: 6/255, green: 114/255, blue: 4/255, alpha: 1)
            values.textColor = UIColor.init(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
            founder.textColor = UIColor.init(red: 6/255, green: 114/255, blue: 4/255, alpha: 1)
            headOfHouse.textColor = UIColor.init(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        case "Hufflepuff":
            houseImage.image = UIImage.init(named: "hufflepuff")!
            houseName.textColor = .yellow
            mascot.textColor = UIColor.init(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
            houseColors.textColor = .yellow
            values.textColor = UIColor.init(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
            founder.textColor = .yellow
            headOfHouse.textColor = UIColor.init(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        default:
            print("no bueno")
        }
        
        houseName.text = house.name
        mascot.text = "Mascot:  \(house.mascot)"
        let str = house.colors.joined(separator: ", ")
        houseColors.text = String("Colors:  \(str)")
        let str2 = house.values.joined(separator: ", ")
        values.text = String("Values:  \(str2)")
        founder.text = String("Founder:  \(house.founder)")
        headOfHouse.text = String("Head of House:  \(house.headOfHouse)")
       
    }
    func houseInfo (imageName: String, houseTitle: UILabel, mascots: UILabel, colors: UILabel, houseValues: UILabel, foundedBy: UILabel, houseHead: UILabel) {
        
    }
}
