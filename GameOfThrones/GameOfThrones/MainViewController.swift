//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var seasons = [[GOTEpisode]](){
        didSet{
            tableView.reloadData()
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
     loadData()
    tableView.reloadData()
    tableView.dataSource = self
   
  }
    func loadData(){
        seasons = GOTEpisode.seasonSections()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episode = segue.destination as? EpisodeDetailViewController,
            let indexPath =  tableView.indexPathForSelectedRow else {
                fatalError("Couldnt access VC")
        }
        
        let eachEpisode = seasons[indexPath.section][indexPath.row]
        
        episode.episodeDetails = eachEpisode
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: GameSeasonTableViewCell!
        
        if indexPath.section % 2 == 0 {
            guard  let evenSeasons = tableView.dequeueReusableCell(withIdentifier: "evenSeasons", for: indexPath) as? GameSeasonTableViewCell else {
                fatalError("Couldnt identify Cell")
            }
            cell = evenSeasons
        } else {
            guard let oddSeasons = tableView.dequeueReusableCell(withIdentifier: "oddSeasons", for: indexPath) as? GameSeasonTableViewCell else {
                fatalError("Coudnt identify Cell")
            }
            cell = oddSeasons
        }
        
        let season = seasons[indexPath.section][indexPath.row]
        cell.configureCell(for: season)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return seasons.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season:\(seasons[section].first?.season ?? 0)" 
    }
}
