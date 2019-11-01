//
//  PersonSearchTableViewController.swift
//  FindACrew
//
//  Created by Joseph Rogers on 10/31/19.
//  Copyright © 2019 Joseph Rogers. All rights reserved.
//

import UIKit

class PersonSearchTableViewController: UITableViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var searchBar: UISearchBar!
    //give us the ability to access a instance of Person Controller
    private let personController = PersonController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tell the search bar that this page is the delegate. so we can intercept the return key press
        searchBar.delegate = self

    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personController.people.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        
        let person = personController.people[indexPath.row]
        cell.person = person
        return cell
    }
}

//MARK: Extensions

//gives us access to the search text

extension PersonSearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        //grabs the text we put into the search bar and passes it into the person controller to use the searchForPeopleWith function upon
        personController.searchForPeopleWith(searchTerm: searchTerm) {
            //a response has been figued out. parsed. stored. added the results to the list of people.
            //signal to the tableview to reload its data.
            DispatchQueue.main.async {
                //takes this line of data and sends it back to the main queue. the main queue is the event loop which is only allowed to do UI updates.
                self.tableView.reloadData()
            }
        }
    }
}
