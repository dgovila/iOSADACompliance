//
//  VoiceOverViewController.swift
//  ADA
//
//  Created by Govila, Dhruv on 02/04/21.
//

import UIKit

class VoiceOverViewController: UIViewController {
    var recipes: [Recipe] = []
    @IBOutlet var imageViewDish: [UIImageView]!
    @IBOutlet var labelDishName: [UILabel]!
    @IBOutlet var labelDishDifficulty: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Voice Over Demo"
        for index in 0..<recipes.count {
            labelDishName[index].text = recipes[index].name
            imageViewDish[index].image = recipes[index].photo
            labelDishDifficulty[index].text = difficultyString(difficulty: recipes[index].difficulty)
            addAccessibility(at: index)
        }
    }
    
    func difficultyString(difficulty: RecipeDifficulty) -> String {
          switch difficulty {
          case .unknown:
            return ""
          case .rating(let value):
            var string = ""
            for _ in 0..<value {
              string.append("🍲")
            }
            return string
          }
    }
    
    private func loadData() {
        if let seedRecipe = Recipe.loadDefaultRecipe() {
          recipes += seedRecipe
          recipes = recipes.sorted(by: { $0.name < $1.name })
        }
    }
}

// MARK:- Adding Accessibility
extension VoiceOverViewController {
    func addAccessibility(at index: Int) {
        // MARK:- Turn on Accessibility
        /// Accessibility for a UIElement can be activate by setting `.isAccessibilityElement` as `true`
        imageViewDish[index].isAccessibilityElement = true
        labelDishDifficulty[index].isAccessibilityElement = true
        
        // MARK: Accessibility Label
        /// This serves as the Desciption of the UIElement
        /// We can add the description to the `.accessibilityLabel` property of a UIElement
        imageViewDish[index].accessibilityLabel = recipes[index].photoDescription
        labelDishDifficulty[index].accessibilityLabel = "Difficulty Level"

        
        // MARK:- Accessibility Trait
        /// Tell an assistive application how an accessibility element behaves or should be treated by setting these accessibility traits
        /// There are several other traits that can viewed by going inside the definition of `.image` or `.none`
        imageViewDish[index].accessibilityTraits = .image
        labelDishDifficulty[index].accessibilityTraits = UIAccessibilityTraits.none

        //MARK:- Accessibility Value
        /// A string that represents the current value of the accessibility element.
        /// If a status of a progress updates we can update the accessibilty value too so that user is intimated of the change
        /// we can update the value by changing `.accessibilityValue` property of the UIElement
        switch recipes[index].difficulty {
        case .unknown:
            labelDishDifficulty[index].accessibilityValue = "Unknown"
        case .rating(let value):
            labelDishDifficulty[index].accessibilityValue = "\(value)"
        }
        
        labelDishDifficulty[index].font = UIFont.preferredFont(forTextStyle: .body)
        labelDishDifficulty[index].adjustsFontForContentSizeCategory = true
    }
}
