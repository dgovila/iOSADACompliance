import UIKit

// Data from: http://damndelicious.net/recipe-index/

enum RecipeDifficulty {
  case unknown
  case rating(Int)
}

extension RecipeDifficulty {
  init?(value: Int) {
    if value > 0 && value <= 5 {
      self = .rating(value)
    } else {
      self = .unknown
    }
  }
}

struct Recipe {
  let name: String
  let difficulty: RecipeDifficulty
  let photo: UIImage?
  let photoDescription: String
  let prepTime: Int
  let cookTime: Int
  let yield: Int
  let ingredients: [String]?
  let directions: [String]?
}

extension Recipe {
  init?(dict: [String: AnyObject]) {
    guard
      let name = dict["name"] as? String,
      let rawDifficulty = dict["difficulty"] as? Int,
      let difficulty = RecipeDifficulty(value: rawDifficulty),
      let prepTime = dict["prepTime"] as? Int,
      let cookTime = dict["cookTime"] as? Int,
      let yield = dict["yield"] as? Int,
      let ingredients = dict["ingredients"] as? [String],
      let directions = dict["directions"] as? [String],
      let photoDescription = dict["photoDescription"] as? String
      else {
        return nil
    }
    
    self.name = name
    self.difficulty = difficulty
    self.prepTime = prepTime
    self.cookTime = cookTime
    self.yield = yield
    self.ingredients = ingredients
    self.directions = directions
    self.photoDescription = photoDescription
    
    if let imageName = dict["imageName"] as? String, !imageName.isEmpty {
      photo = UIImage(named: imageName)
    } else {
      photo = nil
    }
  }
}

// MARK: - Load Sample Data

extension Recipe {
  static func loadDefaultRecipe() -> [Recipe]? {
    return self.loadRecipeFrom("VoiceOverData")
  }
  
  static func loadRecipeFrom(_ plistName: String) -> [Recipe]? {
    guard
      let path = Bundle.main.path(forResource: plistName, ofType: "plist"),
      let array = NSArray(contentsOfFile: path) as? [[String: AnyObject]]
      else {
        return nil
    }
    
    return array.compactMap { Recipe(dict: $0) }
  }
}
