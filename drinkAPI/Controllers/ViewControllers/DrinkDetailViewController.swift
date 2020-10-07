//
//  DrinkDetailViewController.swift
//  drinkAPI
//
//  Created by Alex Lundquist on 10/5/20.
//

import UIKit

class DrinkDetailViewController: UIViewController {

	@IBOutlet weak var drinkImage: UIImageView!
	@IBOutlet weak var drinkNameLabel: UILabel!
	@IBOutlet weak var drinkCategoryLabel: UILabel!
	@IBOutlet weak var drinkGlass: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	@IBOutlet weak var drinkTableView: UITableView!
	
	var receivedDrink: Drink? {
		didSet {
			setupIngredientArray()
		}
	}
	var ingredientArray: [(ingredient: String, measurement: String?)] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		updateView()
    }
	func updateView() {
		self.drinkTableView.delegate = self
		self.drinkTableView.dataSource = self
		guard let drink = receivedDrink else { return }
		drinkNameLabel.text = "name: \(drink.strDrink)"
		drinkCategoryLabel.text = "Category: \(drink.strCategory ?? "")"
		drinkGlass.text = "Glass: \(drink.strGlass ?? "")"
		descriptionLabel.text = "Instructions:\n \(drink.strInstructions ?? "")"
		DrinkController.shared.fetchImage(imageURL: drink.strDrinkThumb ?? "", thumb: false) { (result) in
			switch result {
				case .success(let image):
					self.drinkImage.image = image
				case .failure(let error):
					print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
			}
		}
	}
	func setupIngredientArray() {
		guard let drink = self.receivedDrink else { return }
		if let ingr1 = drink.strIngredient1, let meas1 = drink.strMeasure1 {
			let ingrTuple = (ingredient: ingr1, measurement: meas1)
			ingredientArray.append(ingrTuple)
		}
		if let ingr2 = drink.strIngredient2 {
			let ingrTuple = (ingredient: ingr2, measurement: drink.strMeasure2)
			ingredientArray.append(ingrTuple)
		}
		if let ingr3 = drink.strIngredient3 {
			let ingrTuple = (ingredient: ingr3, measurement: drink.strMeasure3)
			ingredientArray.append(ingrTuple)
		}
		if let ingr4 = drink.strIngredient4 {
			let ingrTuple = (ingredient: ingr4, measurement: drink.strMeasure4)
			ingredientArray.append(ingrTuple)
		}
		if let ingr5 = drink.strIngredient5 {
			let ingrTuple = (ingredient: ingr5, measurement: drink.strMeasure5)
			ingredientArray.append(ingrTuple)
		}
		if let ingr6 = drink.strIngredient6 {
			let ingrTuple = (ingredient: ingr6, measurement: drink.strMeasure6)
			ingredientArray.append(ingrTuple)
		}
		if let ingr7 = drink.strIngredient7 {
			let ingrTuple = (ingredient: ingr7, measurement: drink.strMeasure7)
			ingredientArray.append(ingrTuple)
		}
		if let ingr8 = drink.strIngredient8 {
			let ingrTuple = (ingredient: ingr8, measurement: drink.strMeasure8)
			ingredientArray.append(ingrTuple)
		}
		if let ingr9 = drink.strIngredient9 {
			let ingrTuple = (ingredient: ingr9, measurement: drink.strMeasure9)
			ingredientArray.append(ingrTuple)
		}
		if let ingr10 = drink.strIngredient10 {
			let ingrTuple = (ingredient: ingr10, measurement: drink.strMeasure10)
			ingredientArray.append(ingrTuple)
		}
		if let ingr11 = drink.strIngredient11 {
			let ingrTuple = (ingredient: ingr11, measurement: drink.strMeasure11)
			ingredientArray.append(ingrTuple)
		}
		if let ingr12 = drink.strIngredient12 {
			let ingrTuple = (ingredient: ingr12, measurement: drink.strMeasure12)
			ingredientArray.append(ingrTuple)
		}
		if let ingr13 = drink.strIngredient13 {
			let ingrTuple = (ingredient: ingr13, measurement: drink.strMeasure13)
			ingredientArray.append(ingrTuple)
		}
		if let ingr14 = drink.strIngredient14 {
			let ingrTuple = (ingredient: ingr14, measurement: drink.strMeasure14)
			ingredientArray.append(ingrTuple)
		}
		if let ingr15 = drink.strIngredient15 {
			let ingrTuple = (ingredient: ingr15, measurement: drink.strMeasure15)
			ingredientArray.append(ingrTuple)
		}
	}
}

extension DrinkDetailViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ingredientArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as? IngredientTableViewCell else { return UITableViewCell()}
		let ingredientTuple = ingredientArray[indexPath.row]
		cell.ingredient = ingredientTuple
		return cell
	}
}
