//
//  ViewController.swift
//  Delegate_Protocol
//
//  Created by Marcos Felipe Souza on 10/12/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PersonDetailsViewControllerDelegate {
    
    var personDetailsVC:PersonDetailsViewController?
    @IBOutlet weak var responseDelegate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        responseDelegate.isHidden = true
    }

    @IBAction func viewAction(_ sender: Any) {
        responseDelegate.isHidden = true
        if let personView = Bundle.main.loadNibNamed("PersonDetailView", owner: self, options: nil)?.first as? PersonDetailView {
            personView.delegate = self
            
            //Tela toda menos a tabBar
            //personView.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.size.height - 60)
            
            personView.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.size.height)
            personView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            self.view.addSubview(personView)
        }
        
    }
    
    func addPerson(person: Person) {
        responseDelegate.isHidden = false
        let response = "\(person.name) tem \(person.age) anos"
        responseDelegate.text = response
    }
    
    @IBAction func viewControllerXibs(_ sender: Any) {
        responseDelegate.isHidden = true
        let newItem = ComXibsViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDetail" {
            responseDelegate.isHidden = true
            print("Paranaues")
            personDetailsVC = segue.destination as? PersonDetailsViewController
            personDetailsVC?.delegate = self
        }
    }

}

