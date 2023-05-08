//
//  ListTableViewController.swift
//  WordList
//
//  Created by 杉井位次 on 2023/05/08.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var wordArray: [Dictionary< String,String >] = []
    
    let saveDate = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        //ListTableViewCellを使ってCellを使う
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveDate.array(forKey: "WORD") != nil {
            wordArray = saveDate.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    //セクション数を指定
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //セルの個数を指定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wordArray.count
    }

    //セルの中身の表示の仕方を設定
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! ListTableViewCell
        
        //wordArrayからDictionaryを取り出す
        let nowIndexPathDictionary = wordArray[indexPath.row]
        
        //ラベルに代入
        cell.englishLabel.text = nowIndexPathDictionary["english"]
        cell.japaneseLabel.text = nowIndexPathDictionary["japanese"]
        
        
        return cell
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
