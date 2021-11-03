//
//  AlamofireViewController.swift
//  HarryPotterCharacters
//
//  Created by Ionut Ciovica on 02/11/2021.
//

import UIKit
import Alamofire

class AlamofireViewController: UITableViewController {
    
    var characters = [CharacterAlamofire]()
    var filteredCharacters = [CharacterAlamofire]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterCharacters))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetList))
        
        getAllCharactersFrom()
        
    }
    
    func getAllCharactersFrom() {
        let url = "http://hp-api.herokuapp.com/api/characters"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { responseData in
            guard let data = responseData.data else { return }
            
            do {
                self.characters = try JSONDecoder().decode([CharacterAlamofire].self, from: data)
                
                self.filteredCharacters = self.characters.sorted()
            } catch {
                print("\(error)")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCharacters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var house: String
        var student: String
        var staff: String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let character = filteredCharacters[indexPath.row]
        
        
        if character.house == "" {
            house = ""
        } else {
            house = ", House: \(character.house)"
        }
        
        if character.hogwartsStudent == false {
            student = ""
        } else {
            student = ", Student: \(character.hogwartsStudent)"
        }
        
        if character.hogwartsStaff == false {
            staff = ""
        } else {
            staff = ", Staff: \(character.hogwartsStaff)"
        }
        
        cell.textLabel?.text = "\(character.name)\(house)\(student)\(staff)"
        
        return cell
    }
    
    @objc func filterCharacters() {
        let ac = UIAlertController(title: "Filter characters", message: "Type in to filter...", preferredStyle: .alert)
        ac.addTextField()
        
        let filterAction = UIAlertAction(title: "Filter", style: .default) {
            [weak self, weak ac] _ in
            guard let filterWord = ac?.textFields?[0].text else {
                return
            }
            self?.showCharacters(for: filterWord)
        }
        ac.addAction(filterAction)
        present(ac, animated: true)
    }
    
    @objc func resetList(action: UIAlertAction) {
        filteredCharacters = characters.sorted()
        tableView.reloadData()
    }
    
    func showCharacters(for filter: String) {
        filteredCharacters = filteredCharacters.filter { $0.name.lowercased().contains(filter) }
        self.tableView.reloadData()
    }
}
