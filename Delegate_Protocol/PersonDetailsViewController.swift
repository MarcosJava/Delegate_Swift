//
//  PersonDetailsViewController.swift
//  Delegate_Protocol
//
//  Created by Marcos Felipe Souza on 10/12/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit


protocol PersonDetailsViewControllerDelegate: class {
   func addPerson(person: Person)
}


class PersonDetailsViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    
    weak var delegate:PersonDetailsViewControllerDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBtnOnTap(_ sender: Any) {
        
        guard let name = nameField.text, let age = ageField.text else {return}
        
        let ageInt = Int(age)
        let person = Person(name: name, age: ageInt!)
        
        delegate?.addPerson(person: person)
        guard let navigation = self.navigationController else {return}
        
        navigation.popViewController(animated: true)
        
    }


}
