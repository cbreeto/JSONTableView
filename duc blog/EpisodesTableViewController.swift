//
//  EpisodesTableViewController.swift
//
//  Created by Carlos Brito on 4/3/16.
//

import UIKit
import SafariServices

class EpisodesTableViewController: UITableViewController
{
    var episodes = [Episode]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        episodes = Episode.downloadAllEpisodes()
        self.tableView.reloadData()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .None
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return episodes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Episode Cell", forIndexPath: indexPath) as! EpisodeTableViewCell
        let episode = self.episodes[indexPath.row]
        
        cell.episode = episode

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:
        NSIndexPath)
    {
        let selectedEpisode = self.episodes[indexPath.row]
        
        // import SafariServices
        let safariVC = SFSafariViewController(URL: selectedEpisode.url!)
        safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
        safariVC.delegate = self
        self.presentViewController(safariVC, animated: true, completion: nil)
    }
    
    // MARK: - Target / Action
    
    @IBAction func fullBlogDidTap(sender: AnyObject)
    {
        // import SafariServices
        let safariVC = SFSafariViewController(URL: NSURL(string: "http://www.ductran.io/blog")!)
        safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
        safariVC.delegate = self
        self.presentViewController(safariVC, animated: true, completion: nil)
    }
    
}

extension EpisodesTableViewController : SFSafariViewControllerDelegate
{
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
















