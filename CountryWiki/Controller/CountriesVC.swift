//
//  CountriesVC.swift
//  CountryWiki
//
//  Created by Mohamed Ahmed on 8/21/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

import UIKit
import AFNetworking

class CountriesVC: UIViewController {
    @IBOutlet weak var countryTableView: UITableView!
    
    var data: countryResponse?
    var countryList: [countryData]?
    var filteredCountires: [countryData]?
    var searchingState = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    
    // Networking
    func loadData(){
        NetworkClient.getCountries(success: { (model) in
            if model.IsSuccess == true {
                self.countryList = model.Response
                DispatchQueue.main.async {
                    self.countryTableView.reloadData()
                }
            }
        }) {error in
            print("error",error)
        }
    }
}


extension CountriesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchingState {
            return filteredCountires?.count ?? 0
        } else {
            return countryList?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch searchingState {
        case true :
            let cell = countryTableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryCell
            if let imageURL = filteredCountires?[indexPath.row].FlagPng {
                cell.countryImage.setImageWith(NSURL(string: imageURL)! as URL)
            }
            cell.countryName.text = filteredCountires?[indexPath.row].Name
            cell.countryNativeName.text = filteredCountires?[indexPath.row].NativeName
            cell.countryRegion.text = filteredCountires?[indexPath.row].Region
            cell.countryCurrency.text = filteredCountires?[indexPath.row].CurrencyName
            return cell
            
        case false :
            let cell = countryTableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryCell
            if let imageURL = countryList?[indexPath.row].FlagPng {
                cell.countryImage.setImageWith(NSURL(string: imageURL)! as URL)
            }
            cell.countryName.text = countryList?[indexPath.row].Name
            cell.countryNativeName.text = countryList?[indexPath.row].NativeName
            cell.countryRegion.text = countryList?[indexPath.row].Region
            cell.countryCurrency.text = countryList?[indexPath.row].CurrencyName
            return cell
        }
    }
}

extension CountriesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.3, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.1, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        })
    }
}


extension CountriesVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchingState = false
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
        } else {
            filteredCountires = countryList?.filter({$0.Name!.lowercased().prefix(searchText.count)==searchText.lowercased()})
            searchingState = true
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
        }
    }
}
