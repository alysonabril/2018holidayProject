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
        let house = houses[indexPath.row]
        cell.textLabel?.text = house.name
        switch house.name {
        case "Gryffindor":
            cell.backgroundColor = UIColor.init(red: 191/255, green: 19/255, blue: 21/255, alpha: 1)
            
        case "Ravenclaw":
            cell.backgroundColor = UIColor.init(red: 7/255, green: 49/255, blue: 186/255, alpha: 1)
            
        case "Slytherin":
            cell.backgroundColor = UIColor.init(red: 6/255, green: 114/255, blue: 4/255, alpha: 1)
            
        case "Hufflepuff":
            cell.backgroundColor = UIColor.init(red: 339/255, green: 217/255, blue: 19/255, alpha: 1)
        default:
            cell.backgroundColor = .white
        }
        return cell
    }
}
