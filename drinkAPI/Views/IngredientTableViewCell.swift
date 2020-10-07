//
//  IngredientTableViewCell.swift
//  drinkAPI
//
//  Created by Alex Lundquist on 10/6/20.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

	@IBOutlet weak var ingredientImage: UIImageView!
	@IBOutlet weak var measurementLabel: UILabel!
	@IBOutlet weak var ingredientLabel: UILabel!
	
	var ingredient: (ingredient: String, measurement: String?)? {
		didSet {
			updateCellWith()
		}
	}
	func updateCellWith() {
//		guard let ingredient = ingredient else { return }
		ingredientLabel.text = ingredient?.ingredient ?? ""
		measurementLabel.text = ingredient?.measurement ?? ""
		ingredientImage.image = nil
		DrinkController.shared.fetchImage(imageURL: ingredient?.ingredient ?? "", isIngredient: true, thumb: false) { (result) in
			switch result {
				case .success(let image):
					self.ingredientImage.image = image
				case .failure(let error):
					print("NO FREAKING IMAGE DAMAT!! WHERE is my Ingredient image Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
			}
		}
	}
}
