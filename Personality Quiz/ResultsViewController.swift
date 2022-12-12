//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Matthew Soto on 12/10/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var responses: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //user should not be able to go back and edit final question
        navigationItem.hidesBackButton = true
        
        let animalOutcome = computePersonalityTrait()
        displayPersonality(animal: animalOutcome)
    }
    
    func computePersonalityTrait() -> AnimalType {
        //find number of appearances of each animal
        var animalCount: [AnimalType: Int] = [
            .dog: 0,
            .cat: 0,
            .rabbit: 0,
            .turtle: 0
        ]
        for response in responses {
            animalCount[response.type]! += 1
        }
        
        //return animal with most appearances
        var mostCommonAnimal: AnimalType?
        var mostAppearances = -1
        for (animal, appearances) in animalCount {
            if appearances > mostAppearances {
                mostCommonAnimal = animal
                mostAppearances = appearances
            }
        }
        
        return mostCommonAnimal!
    }
    
    func displayPersonality(animal: AnimalType) {
        resultLabel.text = "You are a \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
