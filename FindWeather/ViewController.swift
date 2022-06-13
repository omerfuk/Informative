//
//  ViewController.swift
//  FindWeather
//
//  Created by Ömer Faruk Kılıçaslan on 13.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = button.frame.size.height / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    //willAppear and willDisappear methods allows me to hide navigation bar for selected vc
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func showWeatherDataTapped(_ sender: Any) {
        
        if textField.text == "" {
            popUpAlert(title1: "Warning", message: "Fields Cannot be Empty")
        }
        else{
            var city = textField.text
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            
            vc.city = city!
            
            self.show(vc, sender: nil)
        }
        
        
    }
    
}


extension ViewController {
    
    func popUpAlert(title1:String, message:String){
        
        let alert = UIAlertController(title: title1, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
        
        
    }
}
