//
//  StockAPIManager.swift
//  fundü
//
//  Created by Nicholas Kaimakis on 12/6/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class StockInfo {
    var ticker: String
    var lastRefreshed: String
    var interval: String
    var timeSeries: [Double]
    
    init?(ticker: String, lastRefreshed: String, interval: String, timeSeries: [Double]){
        self.ticker = ticker
        self.lastRefreshed = lastRefreshed
        self.interval = interval
        self.timeSeries = timeSeries
    }
    init() {
        self.ticker = ""
        self.lastRefreshed = ""
        self.interval = ""
        self.timeSeries = []
    }
}

class StockAPIManager: NSObject {
    static let baseURL: String! = "https://www.alphavantage.co/query?"
    static let apiKey: String! = "T94MDXP24IHU4PMF"
    static let sharedInstance = StockAPIManager()
    static let getPostsEndpoint = "/posts/"
    
    static func getSeriesDaily(ticker:String) -> StockInfo {
        var lastRefreshed = String()
        let interval: String = "1 min"
        var timeSeries = [Double]()
        var stock = StockInfo.init()
        
        let urlString = (baseURL + "function=TIME_SERIES_INTRADAY&symbol=" + ticker + "&interval=1min&apikey=" + apiKey)
        let url = URL(string: (baseURL + "function=TIME_SERIES_INTRADAY&symbol=" + ticker + "&interval=1min&apikey=" + apiKey))
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            else {
                if let urlContent = data {
                    do {
                        let result = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        //print(result)
                        if let meta = result["Meta Data"] as? [String: String] {
                            lastRefreshed = meta["3. Last Refreshed"]!
                        }
                        if let arrayData = result["Time Series (1min)"] as? [String: [String: String]] {
                            for (_, item) in arrayData {
                                print(item["4. close"]!)
                                timeSeries.append( Double(item["4. close"]! )! )
                            }
                        }
                        stock = StockInfo.init(ticker: ticker, lastRefreshed: lastRefreshed, interval: interval, timeSeries: timeSeries)!
                        
                    } catch {
                        print("error processing JSON")
                    }
                }
            }
        }
        print("before resume")
        task.resume()
        print("after resume")
        return stock
    }
}


