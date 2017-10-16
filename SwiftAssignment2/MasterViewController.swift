//
//  MasterViewController.swift
//  TestMD
//
//  Created by Adam Jenkins on 11/9/17.
//  Copyright © 2017 Adam Jenkins. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    
    var segueArray = [String]()
    var segueDictionary = Dictionary<String, UIImage>();


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        segueArray.append("Home")
        segueArray.append("Search")
        segueArray.append("Product List");
        segueArray.append("Finder");
        segueArray.append("Cart");
        segueArray.append("Checkout");
        
        segueDictionary["Home"] = UIImage(named: "home")
        segueDictionary["Search"] = UIImage(named: "search")
        segueDictionary["Product List"] = UIImage(named: "listOfProducts");
        segueDictionary["Finder"] = UIImage(named: "finder");
        segueDictionary["Cart"] = UIImage(named: "cart");
        segueDictionary["Checkout"] = UIImage(named: "checkout");
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: segueArray[indexPath.row], sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let object = segueDictionary[segueArray[indexPath.row]]
            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            controller.detailItem = object
            controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segueArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = segueArray[indexPath.row] // the label text (Home or Menu)
        cell.imageView!.image = segueDictionary[segueArray[indexPath.row]] // the image itself (UIImage: 0x6974728427582.....)
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



}

