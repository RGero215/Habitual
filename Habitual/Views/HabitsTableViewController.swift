//
//  MainViewController.swift
//  Habitual
//
//  Created by Ramon Geronimo on 11/18/18.
//  Copyright © 2018 Ramon Geronimo. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    
    private var persistance = PersistenceLayer()
    
    var habits: [Habit] = [
        Habit(title: "Go to bed before 10p", image: Habit.Images.book),
        Habit(title: "Drink 8 Glasses of Water", image: Habit.Images.book),
        Habit(title: "Commit Today", image: Habit.Images.book),
        Habit(title: "Stand up every Hour", image: Habit.Images.book)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavBar()
        tableView.register(
            HabitTableViewCell.nib,
            forCellReuseIdentifier: HabitTableViewCell.identifier
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        persistance.setNeedsToReloadHabits()
        tableView.reloadData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistance.habits.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HabitTableViewCell.identifier,
            for: indexPath
            ) as! HabitTableViewCell
        let habit = persistance.habits[indexPath.row]
        cell.configure(habit)
        
        return cell
    }


}

extension HabitsTableViewController {
    
    func setupNavBar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        addButton.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
//        habits.insert(habits[0], at: 0)
//        let topIndexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [topIndexPath], with: .automatic)
        let addHabitVc = AddHabitViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: addHabitVc)
        present(navigationController, animated: true, completion: nil)

    }
}
