//
//  V2VC.swift
//  Liberty_APP
//
//  Created by George Digmelashvili on 1/7/21.
//

import UIKit

class V2VC: UIViewController {
    
    @IBOutlet weak var tableView1: UITableView!{
        didSet{
            tableView1.delegate = self
            tableView1.dataSource = self
        }
    }
    @IBOutlet weak var tableView2: UITableView!{
        didSet{
            tableView2.delegate = self
            tableView2.dataSource = self
        }
    }
    
    @IBOutlet weak var newCountryTextF: UITextField!
    
    var searching = false
    var countries = [String]()
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func AddButton(_ sender: UIButton) {
        if newCountryTextF.text!.isEmpty || countries.contains(newCountryTextF.text!){return}
        else{
            countries.append(newCountryTextF.text!)
            data = countries
            newCountryTextF.text = ""
            tableView1.reloadData()
            tableView2.reloadData()
        }
    }
    
    @IBAction func Search(_ sender: UITextField) {
        if sender.text!.isEmpty{
            searching = false
            data = countries
            tableView1.reloadData()
            tableView2.reloadData()
            return
        }
        data = countries.filter{$0.localizedStandardContains(sender.text!)}
        searching = true
        tableView1.reloadData()
        tableView2.reloadData()
    }
    
    
    
}


extension V2VC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case tableView1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCellV2", for: indexPath) as! CountryCellV2
            cell.CountryLabel.text = data[indexPath.row]
            return cell
        case tableView2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeleteCellV2", for: indexPath) as! DeleteCellV2
            return cell
            
        default: return UITableViewCell(frame: CGRect())
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if searching{
            if let ind = countries.firstIndex(of: data[indexPath.row]) { countries.remove(at: ind) }
            data.remove(at: indexPath.row)
            tableView1.deleteRows(at: [indexPath], with: .automatic)
            tableView2.deleteRows(at: [indexPath], with: .automatic)
        }
        else{
            countries.remove(at: indexPath.row)
            data = countries
            tableView1.deleteRows(at: [indexPath], with: .automatic)
            tableView2.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView1 {
            tableView2.contentOffset = scrollView.contentOffset
            tableView2.contentSize.height = scrollView.contentSize.height
        } else {
            tableView1.contentOffset = scrollView.contentOffset
            tableView1.contentSize.height = scrollView.contentSize.height
        }
    }
}
