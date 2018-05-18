//
//  DoneVC.swift
//  BeastListExam
//
//  Created by Kevan Wang on 5/18/18.
//  Copyright © 2018 Kevan Wang. All rights reserved.
//

import UIKit
import CoreData

class DoneVC: UIViewController {
    
    @IBOutlet weak var doneTableView: UITableView!
    
    var tableData:[Item] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        doneTableView.dataSource = self
        doneTableView.delegate = self
        dateFormatter.dateFormat = "E MMM d"
        fetchDoneItems()
        // Do any additional setup after loading the view.
    }

    @IBAction func toBeastClicked(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchDoneItems() {
        let request:NSFetchRequest<Item> = Item.fetchRequest()
        do {
            let allItems = try context.fetch(request)
            for item in allItems {
                if item.completed {
                    tableData.append(item)
                }
            }
        } catch {
            print("\(error)")
        }
    }

}

extension DoneVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell2", for: indexPath) as! DoneVCCell
        cell.itemName.text = tableData[indexPath.row].name
        let date = tableData[indexPath.row].date!
        cell.itemDate.text = dateFormatter.string(from: date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
