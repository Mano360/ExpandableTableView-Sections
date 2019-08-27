//
//  ViewController.swift
//  ManoexpandableSections
//
//  Created by Manohar Throvagunta on 25/08/19.
//  Copyright © 2019 Omincuris. All rights reserved.
//

import UIKit

struct celldata {
    var opend = Bool()
    var title = String()
    var sectionData = [String]()
}

class ViewController:UITableViewController {
    
    var tableViewData = [celldata]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [
            celldata(opend:false, title:"manohar", sectionData:["cell1","cell2","cell3","cell4"]),celldata(opend:false, title:"manohar1", sectionData:["cell4","cell5","cell6","cell7"]),celldata(opend:false, title:"manohar2", sectionData:["cell8","cell9","cell10","cell11"]),celldata(opend:false, title:"manohar3", sectionData:["cell12","cell13","cell14","cell15"])]
        // Do any additional setup after loading the view.
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    // number of rows in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if tableViewData[section].opend == true {
          return tableViewData[section].sectionData.count + 1
       }else{
         return 1
        }
    }
    
    // create a cell for each table view row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataIndex = indexPath.row - 1
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier:"cell") else { return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier:"cell") else { return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            return cell
        }
    }
    // method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opend == true {
                tableViewData[indexPath.section].opend = false
                let section = IndexSet.init(integer:indexPath.section)
                tableView.reloadSections(section, with: .none)
            }else{
                tableViewData[indexPath.section].opend = true
                let section = IndexSet.init(integer:indexPath.section)
                tableView.reloadSections(section, with: .none)
            }
        }
        print("You tapped cell number \(indexPath.row).")
    }

}

