//
//  CheckListTableViewController.swift
//  CheckListAPP
//
//  Created by 廖晨如 on 2022/12/27.
//

import UIKit


class CheckListTableViewController: UITableViewController {

    let clean_works = ["#01 洗大門", "#02 吸地", "#03 拖地", "#04 擦窗戶", "#05 洗窗簾＆被單", "#06 擦桌子", "#07 掃廁所", "#08 倒垃圾", "#09 清廚房", "#10 整理書房"]
    var clean_finish = [Bool]()
    let year_works = ["#01 貼春聯", "#02 拿年菜", "#03 煮飯", "#04 拜拜", "#05 燒金子", "#06 穿新衣", "#07 倒垃圾", "#08 發紅包", "#09 圍爐", "#10 守歲"]
    var year_finish = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clean_finish = Array(repeating: false, count: clean_works.count)
        year_finish = Array(repeating: false, count: year_works.count)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return clean_works.count
        }else{
            return year_works.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListTableViewCell", for: indexPath) as? CheckListTableViewCell else{
            fatalError("dequeueReusableCell CheckListTableViewCell failed")
        }

        if indexPath.section == 0{
            cell.textLabel?.text = clean_works[indexPath.row]
            if(clean_finish[indexPath.row]){
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }else{
            cell.textLabel?.text = year_works[indexPath.row]
            if(year_finish[indexPath.row]){
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }
        

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "大掃除"
        default:
            return "除夕夜"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            clean_finish[indexPath.row] = !clean_finish[indexPath.row]
        }else{
            year_finish[indexPath.row] = !year_finish[indexPath.row]
        }
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
