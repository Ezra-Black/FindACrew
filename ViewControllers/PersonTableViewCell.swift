//
//  PersonTableViewCell.swift
//  FindACrew
//
//  Created by Joseph Rogers on 10/31/19.
//  Copyright © 2019 Joseph Rogers. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!

    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        genderLabel.text = "Gender: \(person.gender)"
        birthYearLabel.text = "Birth Year: \(person.birth_year)"
    }
}
