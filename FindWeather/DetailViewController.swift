//
//  DetailViewController.swift
//  FindWeather
//
//  Created by Ömer Faruk Kılıçaslan on 13.06.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    var city = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        cityLabel.text = city
        getTodayResult(cityName: city)
    }
    
    func getTodayResult(cityName:String) {
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=9484dfc6ee2d02d1889a30cddb49212e") {
            
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if error == nil {
                    
                    if let incomingData = data {
                        
                        do {
                            
                            let json = try JSONSerialization.jsonObject(with: incomingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
//                            print(json)
                            
                            if let main = json["main"] as? NSDictionary {
                                
                                if let temp = main["temp"] as? Double{
                                    let state = Int(temp - 273.15)
                                    
                                    DispatchQueue.main.async {
                                        self.degreeLabel.text = String(state)
                                    }
                                }
                                
                            }
                            
                            
                            
                        } catch  {
                            print("An error occured while reading data")
                        }
                    }
                }
                else{
                    print(error)
                }
            }
            task.resume()
        }
    }

}
