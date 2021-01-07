//
//  ViewController.swift
//  Liberty_APP
//
//  Created by George Digmelashvili on 1/7/21.
//

import UIKit

class V1VC: UIViewController {
    
    @IBOutlet weak var newCountryTextF: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searching = false
    var countries = [String]()
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        data = countries
    }
    
    @IBAction func AddButton(_ sender: UIButton) {
        if newCountryTextF.text!.isEmpty || countries.contains(newCountryTextF.text!){return}
        else{
            countries.append(newCountryTextF.text!)
            countries.append("")
            data = countries
            newCountryTextF.text = ""
            collectionView.reloadData()
        }
    }
    @IBAction func Search(_ sender: UITextField) {
        if sender.text!.isEmpty{
            searching = false
            data = countries
            collectionView.reloadData()
            return
        }
        searching = true
        let filt = countries.filter{$0.localizedStandardContains(sender.text!)}
        data.removeAll()
        for i in filt {
            data.append(i)
            data.append("")
        }
        collectionView.reloadData()
    }
    
}

extension V1VC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = indexPath.row % 2 == 0 ?  collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCell", for: indexPath) as! CountryCell :collectionView.dequeueReusableCell(withReuseIdentifier: "DeleteCell", for: indexPath) as! DeleteCell
        cell.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        if cell is CountryCell { let c = cell as! CountryCell; c.country = data[indexPath.row]}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return indexPath.row % 2 == 0 ? CGSize(width: self.view.frame.width - 50, height: 40) : CGSize(width: 44, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row % 2 != 0{
            if searching {
                if let ind = countries.firstIndex(of: data[indexPath.row - 1]){
                    countries.remove(at: ind)
                    countries.remove(at: ind)
                }
                data.remove(at: indexPath.row)
                data.remove(at: indexPath.row - 1)
                collectionView.deleteItems(at: [indexPath, IndexPath(row: indexPath.row - 1, section: 0)])
            }
            else{
                countries.remove(at: indexPath.row)
                countries.remove(at: indexPath.row - 1)
                data = countries
                collectionView.deleteItems(at: [indexPath, IndexPath(row: indexPath.row - 1, section: 0)])
            }
        }
    }
    
    
}

