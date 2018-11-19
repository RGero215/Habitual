//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Ramon Geronimo on 11/18/18.
//  Copyright © 2018 Ramon Geronimo. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {
    var habitImage: Habit.Images!
    

    @IBOutlet weak var habitImageView: UIImageView!
    @IBOutlet weak var habitNameInputField: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
    private func updateUI() {
        title = "New Habit"
        habitImageView.image = habitImage.image
    }

    @IBAction func createHabitButtonPressed(_ sender: Any) {
        var persistenceLayer = PersistenceLayer()
        guard let habitText = habitNameInputField.text else { return }
        persistenceLayer.createNewHabit(name: habitText, image: habitImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
