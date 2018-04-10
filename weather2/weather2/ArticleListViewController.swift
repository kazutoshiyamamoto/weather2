//
//  ArticleListViewController.swift
//  weather2
//
//  Created by home on 2018/04/08.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ArticleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "現在の天気"
        weatherInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // JSONから取り出したデータを格納する配列
    var cityNames: [String] = []
    var weathers: [String] = []
    var temperatures: [Double] = []
    var humiditys: [Double] = []
    var icons: [String] = []
    var images: [UIImage] = []
    
    // JSONからデータを取り出し配列に入れる
    func weatherInfo() {
        Alamofire.request("http://api.openweathermap.org/data/2.5/group?id=2128295,2111149,1850147,1856057,1860244,1853908,1862415,1859146,1863967,1856035&units=metric&appid=ecea42c72b75c53caefaa93002224dd6").validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for (_,subJson):(String, JSON) in json["list"] {
                    let cityName = subJson["name"].stringValue
                    let weather = subJson["weather"][0]["main"].stringValue
                    let temperature = (subJson["main"]["temp"].double)!
                    let humidity = (subJson["main"]["humidity"].double)!
                    let icon = subJson["weather"][0]["icon"].stringValue
                    
                    self.cityNames.append(cityName)
                    self.weathers.append(weather)
                    self.temperatures.append(temperature)
                    self.humiditys.append(humidity)
                    self.icons.append(icon)
                    
                    let url = NSURL(string:"http://openweathermap.org/img/w/\(icon).png")!
                    let imageData = try? Data(contentsOf: url as URL)
                    let image = UIImage(data:imageData!)
                    self.images.append(image!)
                }
            case .failure(let error):
                print(error)
            }
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = self.cityNames[indexPath.row]
        cell.detailTextLabel?.text = "\(self.temperatures[indexPath.row])℃, \(self.weathers[indexPath.row]): \(self.humiditys[indexPath.row])%"
        cell.imageView?.image = self.images[indexPath.row]
        return cell
    }
}
