//
//  PersonDetailView.swift
//  Delegate_Protocol
//
//  Created by Marcos Felipe Souza on 11/12/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit

class PersonDetailView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var delegate:PersonDetailsViewControllerDelegate?
    
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    @IBAction func teste(_ sender: Any) {
        guard let name = nameField.text, let age = ageField.text else {return}
        if let ageInt = Int(age) {
            let person = Person(name: name, age: ageInt)
            if let retorno = delegate {
                retorno.addPerson(person: person)
            }
        }        
        self.removeFromSuperview()
    }
    
    
    
}
