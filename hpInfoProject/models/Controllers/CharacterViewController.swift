//
//  ViewController.swift
//  hpInfoProject
//
//  Created by Alyson Abril on 1/2/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var characterTableView: UITableView!
    
    var people = [HPCharacter](){
        didSet{
            DispatchQueue.main.async{
                self.characterTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.dataSource = self
        getHPCharacters()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = characterTableView.indexPathForSelectedRow,
            let characterDetailViewController = segue.destination as? CharacterDetailViewController else {
                fatalError("indexPath, elementDVC nil")
        }
        let person = people[indexPath.row]
        characterDetailViewController.person = person
    }
    
    
    @objc private func getHPCharacters() {
        HPAPIClient.searchHPCharacter(keyword: "") { (error, person) in
            if let error = error{
                print(error)
            }
            else if let person = person{
                self.people = person
                
            }
        }
    }
}


extension CharacterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        let person = people[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
}
