//
//  ComXibsViewController.swift
//  Delegate_Protocol
//
//  Created by Marcos Felipe Souza on 11/12/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit

class ComXibsViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    let delegate:PersonDetailsViewControllerDelegate?
    
    init(delegate:PersonDetailsViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: "ComXibsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func salvarBtnOnTap(_ sender: Any) {
        guard let name = nameField.text, let age = ageField.text else {return}
        
        if let ageInt = Int(age) {
            let person = Person(name: name, age: ageInt)
            if let delegatePerson = delegate {
                delegatePerson.addPerson(person: person)
            }
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
