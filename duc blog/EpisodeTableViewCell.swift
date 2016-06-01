//
//  EpisodeTableViewCell.swift
//  Duc Blog
//
//  Created by Carlos Brito on 4/3/16.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell
{
    
    var episode: Episode! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        titleLabel.text = episode.title
        authorImageView.image = UIImage(named: "duc")
        descriptionLabel.text = episode.description
        createdAtLabel.text = "Duc Tran | \(episode.createdAt!)"
        
        let thumbnailURL = episode.thumbnailURL
        let networkService = NetworkService(url: thumbnailURL!)
        networkService.downloadImage { (imageData) in
            let image = UIImage(data: imageData)
            dispatch_async(dispatch_get_main_queue(), {
                self.thumbnailImageView.image = image
            })
        }
        
        authorImageView.layer.cornerRadius = authorImageView.bounds.width / 2.0
        authorImageView.layer.masksToBounds = true
        authorImageView.layer.borderColor = UIColor.whiteColor().CGColor
        authorImageView.layer.borderWidth = 1.0
    }
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
}
