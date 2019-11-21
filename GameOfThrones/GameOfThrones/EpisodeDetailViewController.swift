//
//  EpisodeDetailViewController.swift
//  GameOfThrones
//
//  Created by Tiffany Obi on 11/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var largerImage: UIImageView!
    @IBOutlet weak var summaryTextView: UITextView!
    
    var episodeDetails: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        guard let eachEpisode = episodeDetails else {fatalError("Couldnt identify episode")
        }
        navigationItem.title = eachEpisode.name
        largerImage.image = UIImage(named:eachEpisode.originalImageID)
        summaryTextView.text = eachEpisode.summary
    }
    

}
