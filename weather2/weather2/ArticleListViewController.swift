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


struct Weather {
    var cityName: String
    
    init(cityName: String) {
        self.cityName = cityName
}
}

var weather = [Weather]()


class ArticleListViewController: UIViewController
//    , UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "現在の天気"
        

        getWeather()
//        tableView.dataSource = self
//        tableView.delegate = self
//        getArticles()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//        // 要素を入れるプロパティを定義
//        var articles: [[String: String?]] = []
    
    // itemsをJSONの配列と定義
    var items: [JSON] = []
    
        func getWeather() {
            Alamofire.request("http://api.openweathermap.org/data/2.5/group?id=2128295,2111149,1850147,1856057,1860244,1853908,1862415,1859146,1863967,1856035&units=metric&appid=ecea42c72b75c53caefaa93002224dd6").validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    let list = json[1]["list"][2]["weather"].stringValue
                    print(list)
                    
                        case .failure(let error):
                        print(error)
//                    // 1つの地域の天気を表す辞書型を作る
//                    let article: [String: String?] = [
//                        "cityName": json["name"].stringValue,
//                        "weather": json["weather"][0]["main"].stringValue,
//                        "temperature": json["main"]["temp"].stringValue,
//                        "icon": json["weather"][0]["icon"].stringValue
//                    ]
//                    // 配列に入れる
//                    self.articles.append(article)
//                    // 配列の確認
//                    print(self.articles)
                }
            }
            }
    
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return items.count
//        }
//
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
//            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//            cell.textLabel?.text = items[indexPath.row]["name"].stringValue
//            cell.detailTextLabel?.text = items[indexPath.row]["main"].stringValue
//
//            if let icon = article["icon"]!  {
//                let url = NSURL(string:"http://openweathermap.org/img/w/\(icon).png")!
//                let imageData = try? Data(contentsOf: url as URL)
//                let image = UIImage(data:imageData!)
//                cell.imageView?.image = image
//            }
    
//            return cell
//        }
    



    
    
    
    
    
    
    
    // 以下バックアップ用
    
//    // 要素を入れるプロパティを定義
//    var articles: [[String: String?]] = []
//
//    func getArticles() {
//        Alamofire.request("http://api.openweathermap.org/data/2.5/group?id=2128295,2111149,1850147,1856057,1860244,1853908,1862415,1859146,1863967,1856035&units=metric&appid=ecea42c72b75c53caefaa93002224dd6").validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                // 1つの地域の天気を表す辞書型を作る
//                let article: [String: String?] = [
//                    "cityName": json["name"].stringValue,
//                    "weather": json["weather"][0]["main"].stringValue,
//                    "temperature": json["main"]["temp"].stringValue,
//                    "icon": json["weather"][0]["icon"].stringValue
//                ]
//                // 配列に入れる
//                self.articles.append(article)
//                // 配列の確認
//                print(self.articles)
//
//            case .failure(let error):
//                print(error)
//            }
//            self.tableView.reloadData()
//        }
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return articles.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//        let article = articles[indexPath.row]
//        cell.textLabel?.text = article["cityName"]!
//        cell.detailTextLabel?.text = article["weather"]!
//
//        if let icon = article["icon"]!  {
//            let url = NSURL(string:"http://openweathermap.org/img/w/\(icon).png")!
//            let imageData = try? Data(contentsOf: url as URL)
//            let image = UIImage(data:imageData!)
//            cell.imageView?.image = image
//        }
//
//        return cell
//    }
}
