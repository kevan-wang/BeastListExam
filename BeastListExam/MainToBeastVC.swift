//
//  ViewController.swift
//  BeastListExam
//
//  Created by Kevan Wang on 5/18/18.
//  Copyright © 2018 Kevan Wang. All rights reserved.
//

import UIKit
import CoreData

class MainToBeastVC: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    var tableData:[Item] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        fetchUndoneItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddEditSegue" {
            let nav = segue.destination as! UINavigationController
            let dest = nav.topViewController as! AddEditVC
            dest.delegate = self
            if let ip = sender as? IndexPath {
                dest.itemEdit = tableData[ip.row]
            }
        }
        else if segue.identifier == "DoneSegue" {
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "AddEditSegue", sender: indexPath)
    }

    @IBAction func beastButtonPressed(_ sender: UIButton) {
        let item = tableData[sender.tag]
        item.completed = true
        saveContext()
        tableData.remove(at: sender.tag)
        mainTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            let item = tableData[indexPath.row]
            context.delete(item)
            tableData.remove(at: indexPath.row)
            saveContext()
            tableView.reloadData()
        }
    }
    
    func fetchUndoneItems() {
        let request:NSFetchRequest<Item> = Item.fetchRequest()
        do {
            let allItems = try context.fetch(request)
            for item in allItems {
                if !item.completed {
                    tableData.append(item)
                }
            }
        } catch {
            print("\(error)")
        }
    }
    
}

extension MainToBeastVC: UITableViewDataSource, UITableViewDelegate, AddEditDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MainVCCell
        cell.itemLabel.text = tableData[indexPath.row].name
        cell.beastButton.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func addItem(name: String, date: Date) {
        let newItem = Item(context: context)
        newItem.name = name
        newItem.date = date
        newItem.completed = false
        saveContext()
        tableData.append(newItem)
        mainTableView.reloadData()
    }
    
    func editItem(name: String, date: Date, item: Item) {
        item.name = name
        item.date = date
        saveContext()
        mainTableView.reloadData()
    }
}

protocol AddEditDelegate: class {
    func addItem(name: String, date: Date)
    func editItem(name: String, date: Date, item: Item)
}



