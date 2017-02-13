//
//  MoviesViewController.swift
//  MovieViewer
//
//  Created by Madel Asistio on 1/31/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [NSDictionary]?
    var endpoint: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Flicks"
        if let navigationBar = navigationController?.navigationBar {
            
            // sets backgroundImage
            //navigationBar.setBackgroundImage(UIImage(named: "testnavBar"), for: .default)
            // changes background colors
            navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
            // changes the back button colors
            navigationBar.barTintColor = UIColor.black
            
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.gray.withAlphaComponent(0.5)
            shadow.shadowOffset = CGSize(width: 2, height: 2);
            shadow.shadowBlurRadius = 2;
            navigationBar.titleTextAttributes = [
                NSFontAttributeName : UIFont(name: "Bodoni 72", size: 40)!,
                // changes text color
                NSForegroundColorAttributeName : UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                NSShadowAttributeName : shadow
            ]
        }
        
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at:0)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        print(endpoint)
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(endpoint!)?api_key=\(apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    print(dataDictionary)
                    
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.movies = dataDictionary["results"] as? [NSDictionary]
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()

        // Do any additional setup after loading the view.
    }
    
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    print(dataDictionary)
                    
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.movies = dataDictionary["results"] as? [NSDictionary]
                    
                    self.tableView.reloadData()
                    refreshControl.endRefreshing()
                }
            }
        }
        task.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // if movies is not nil then assign to a constant called movies and return the count of movies, if nil then return 0 cells
        
        if let movies = movies {
            return movies.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies![indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        let baseUrl = "https://image.tmdb.org/t/p/w500/"
        
        if let posterPath = movie["poster_path"] as? String {
            let imageUrl = NSURL(string: baseUrl + posterPath)
             cell.posterView.setImageWith(imageUrl! as URL)
        }
        
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
       
        // cell color
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.5)
        cell.selectedBackgroundView = backgroundView
        
        
        print("row \(indexPath.row)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     tableView.deselectRow(at: indexPath, animated: true)
    
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
        let movie = movies![indexPath!.row]
        
        let detailViewController = segue.destination as! DetailViewController
        
        detailViewController.movie = movie
        
        print ("prepare for segue is called")
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
