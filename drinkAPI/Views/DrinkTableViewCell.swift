//
//  DrinkTableViewCell.swift
//  drinkAPI
//
//  Created by Alex Lundquist on 10/5/20.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {

	@IBOutlet weak var drinkThumbImageView: UIImageView!
	@IBOutlet weak var drinkNameLabel: UILabel!
	@IBOutlet weak var drinkExtraLabel: UILabel!
	
	var drinkcell: Drink? {
		didSet{
				updateCellWith()
		}
	}
	func updateCellWith() {
		guard let drinkcell = drinkcell else { return }
		DrinkController.shared.fetchImage(imageURL: drinkcell.strDrinkThumb ?? "", thumb: true, completion: { (result) in
			switch result {
				case .success(let image):
					self.drinkThumbImageView.image = image
					self.drinkThumbImageView.layer.cornerRadius = 8
					self.drinkThumbImageView.clipsToBounds = true
					self.drinkNameLabel.text = drinkcell.strDrink
					self.drinkExtraLabel.text = drinkcell.strCategory
				case .failure(let error):
					print("The image blew up and I go this Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
			}
		})
	}
}
