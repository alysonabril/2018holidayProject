//
//  HouseViewController.swift
//  hpInfoProject
//
//  Created by Alyson Abril on 1/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {
    
    
    @IBOutlet weak var houseTableView: UITableView!
    
    
    var houses = [House]() {
        didSet{
            DispatchQueue.main.async {
                self.houseTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        houseTableView.dataSource = self
        houseTableView.backgroundView = UIImageView(image: UIImage(named: "parchment")!)
        getHPHouse()
    }
    
    @objc private func getHPHouse() {
        HPAPIClient.searchHPHouse(keyword: "") { (appError, house) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let house = house {
                self.houses = house
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = houseTableView.indexPathForSelectedRow,
            let houseDetailViewController = segue.destination as? HouseDetailViewController else {
                fatalError("indexPath, houseDVC nil")
        }
        let house = houses[indexPath.row]
        houseDetailViewController.house = house
    }
}


extension HouseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "houseCell", for: indexPath)
        
        let customView = UIView()
        
        let house = houses[indexPath.row]
        cell.textLabel?.text = house.name
        
        switch house.name {
        case "Gryffindor":
            cell.backgroundColor = .clear
            cell.textLabel?.textColor = UIColor.init(red: 191/255, green: 19/255, blue: 21/255, alpha: 1)
            customView.backgroundColor = UIColor.init(red: 212/255, green: 175/255, blue: 55/255, alpha: 1)
            cell.selectedBackgroundView = customView
            
        case "Ravenclaw":
            cell.backgroundColor = .clear
            cell.textLabel?.textColor = UIColor.init(red: 7/255, green: 49/255, blue: 186/255, alpha: 1)
            customView.backgroundColor = UIColor.init(red: 205/255, green: 127/255, blue: 50/255, alpha: 1)
            cell.selectedBackgroundView = customView
            
        case "Slytherin":
            cell.backgroundColor = .clear
            cell.textLabel?.textColor = UIColor.init(red: 6/255, green: 114/255, blue: 4/255, alpha: 1)
            customView.backgroundColor = UIColor.init(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
            cell.selectedBackgroundView = customView
            
        case "Hufflepuff":
            cell.backgroundColor = .clear
            cell.textLabel?.textColor = .yellow
            customView.backgroundColor = .black
            cell.selectedBackgroundView = customView
        default:
            cell.backgroundColor = .white
        }
        return cell
    }
}

