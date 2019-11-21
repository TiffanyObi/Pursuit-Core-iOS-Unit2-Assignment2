//
//  GameSeasonTableViewCell.swift
//  GameOfThrones
//
//  Created by Tiffany Obi on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GameSeasonTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var seasonAndEpisodeNumber: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureCell(for gOTEpisode: GOTEpisode ){
        episodeName.text = gOTEpisode.name
        seasonAndEpisodeNumber.text = "Season: \(gOTEpisode.season) , Episode \(gOTEpisode.number)"
        
        episodeImage.image = UIImage(named: "\(gOTEpisode.mediumImageID)")
        
    }
   
}
