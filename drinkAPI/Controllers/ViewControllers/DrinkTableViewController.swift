//
//  DrinkTableViewController.swift
//  drinkAPI
//
//  Created by Alex Lundquist on 10/5/20.
//

import UIKit

class DrinkTableViewController: UITableViewController {

	
	var cocktails: [Drink] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupVC()

    }


    // MARK: - Table view data source
	func setupVC(){
		DrinkController.shared.fetchDrink(path: .search, termName: "f", termValue: "b") { (result) in
			switch result {
				case .success(let fetchedData):
					guard let fetchedData = fetchedData else { return }
					self.cocktails = fetchedData
					print(self.cocktails.first!)
				case .failure(let error):
					print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
			}
			self.tableView.reloadData()
		}
	}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return cocktails.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as? DrinkTableViewCell else { return UITableViewCell()}
		let drink = cocktails[indexPath.row]
		cell.drinkcell = drink
		return cell 
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		//Setting Custom Back Button Text
		navigationItem.backBarButtonItem = UIBarButtonItem(
			title: "Back", style: .plain, target: nil, action: nil)
		if segue.identifier == "toDetailVC" {
			guard let indexPath = tableView.indexPathForSelectedRow,
				  let destinationVC = segue.destination as? DrinkDetailViewController else { return }
			let drinkToSend = cocktails[indexPath.row]
			destinationVC.receivedDrink = drinkToSend
		}
    }


}
