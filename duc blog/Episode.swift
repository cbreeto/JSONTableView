//
//  Episode.swift
//
//  Created by Carlos Brito on 4/3/16.
//

import Foundation


class Episode
{
    var title: String?
    var description: String?
    var thumbnailURL: NSURL?
    var createdAt: String?
    var author: String?
    var url: NSURL?
    
    init(title: String, description: String, thumbnailURL: NSURL, createdAt: String, author: String)
    {
        self.title = title
        self.description = description
        self.thumbnailURL = thumbnailURL
        self.createdAt = createdAt
        self.author = author
    }
    
    
    init (espDictionary : [String : AnyObject]) {
        self.title = espDictionary ["title"] as? String
        self.description = espDictionary["description"] as? String
        self.thumbnailURL = NSURL (string: espDictionary["thumbnailURL"] as! String)
        
        self.createdAt = espDictionary["pubDate"] as? String
        self.author = espDictionary["author"] as? String
        self.url = NSURL(string: espDictionary["link"] as! String)
    }
    
    static func downloadAllEpisodes() -> [Episode] {
        var episodes = [Episode]()
        
        
        let jsonFile = NSBundle.mainBundle().pathForResource("DucBlog", ofType: "json")
        let jsonData = NSData(contentsOfFile: jsonFile!)
        
        
        //turn the data into foundation objects (Episodes)
        if let jsonDictionary = NetworkService.parseJSONFromData(jsonData) {
        
            let espDictionaries = jsonDictionary["episodes"] as! [[String : AnyObject]]
            
            for espDictionary in espDictionaries {
                let newEpisode = Episode(espDictionary: espDictionary)
                episodes.append(newEpisode)
            }
        
        
        }
        
        
        
        
        return episodes
        
    }
}





















