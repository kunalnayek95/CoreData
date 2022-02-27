//
//  CategoryVC.swift
//  Test
//
//  Created by Kunal's MacBook on 24/02/22.
//

import UIKit
import CoreData

class CategoryVC: UITableViewController {
    
    var categoryArr = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    //MARK: - save item
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        self.tableView.reloadData()
    }

    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) {  (action) in
            let newCat = Category(context: self.context)
            newCat.name = textField.text!
            
            self.categoryArr.append(newCat)
            self.saveItems()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Read Data
    func loadData(with request: NSFetchRequest<Category> = Category.fetchRequest()){
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            categoryArr = try context.fetch(request)
        } catch{
            print("Error fetching data from context \(error)")
        }
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArr[indexPath.row].name
       
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TodoVC") as! TodoVC
        nav.selectedCategory = categoryArr[indexPath.row]
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
}
