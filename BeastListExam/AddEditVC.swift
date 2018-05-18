//
//  AddEditVC.swift
//  BeastListExam
//
//  Created by Kevan Wang on 5/18/18.
//  Copyright © 2018 Kevan Wang. All rights reserved.
//

import UIKit

class AddEditVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var delegate:AddEditDelegate! = nil
    var itemEdit:Item! = nil
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        if textField.text! != "" {
            let name = textField.text!
            let date = Date()
            if itemEdit == nil {
                delegate.addItem(name: name, date: date)
                dismiss(animated: true, completion: nil)
            }
            else {
                delegate.editItem(name: name, date: date, item: itemEdit)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if itemEdit != nil {
            textField.text = itemEdit.name!
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
