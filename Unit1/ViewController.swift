//
//  ViewController.swift
//  Unit1
//
//  Created by Gerdin Ventura on 9/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var businesses: [Business]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        getData()
    }
    
    func getData() {
        let key = "Bearer Y954dIVSob7YUelk2jeP7Xi2vJcx6FUQXLWH-CfcYMX476ecnwoW4d4Ge2SWwSK1q8A1H6ltB5De8OExC7HBDBEQiyYomXnd-tQnaS6OvNGQ2PNphZEBRVrTkwYvYHYx"
        let str = "https://api.yelp.com/v3/businesses/search?latitude=38.98582939&longitude=-76.937329584"
        let url = URL(string: str)
        var req = URLRequest(url: url!)
        
        req.addValue(key, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: req, completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                print("Error with request")
                return
            }
            
            do {
                self.businesses = try JSONDecoder().decode(Response.self, from: data).businesses
            } catch {
                print("Error decoding data")
                return
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }).resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard (businesses?.count != nil) else {
            return 0
        }
        return businesses!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YelpCell", for: indexPath) as! YelpCell

        let business = businesses![indexPath.row]
        
        cell.title.text = business.name
        cell.phoneNumber.text = business.phone
        cell.reviewCount.text = "\(business.review_count)"
        
        return cell
    }
}

struct Response: Codable {
    let businesses: [Business]
}

struct Business: Codable {
    let name: String
    let review_count: Int
    let phone: String
}

