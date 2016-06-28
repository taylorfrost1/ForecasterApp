//
//  WeatherTableViewController.swift
//  WeatherApp2
//
//  Created by Taylor Frost on 6/23/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherTableViewController: UITableViewController {
    
    var citiesArray = [City]()
    var cityName: String = ""
    var zipcode: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
        print("The button is being tapped")
        
        // Create AlertController
        let alertController = UIAlertController(title: "Add City", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        // Create the Save Action with textfields
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            if let name = firstTextField.text {
                self.cityName = name
           
            }
            
            if let code = secondTextField.text {
                self.zipcode = code

            }
            
            print(firstTextField.text)
            print(secondTextField.text)
        
            self.geocoding(self.zipcode, completion: {(latitude, longitude) in
            
            let currentCity = City(name: self.cityName, zipcode: self.zipcode, latitude: latitude, longitude: longitude)
                
                self.citiesArray.append(currentCity)
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.tableView.reloadData()})
           
            })

            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter City Name"
        }
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Zipcode"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)


    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
       return self.citiesArray.count
    }
 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! WeatherTableViewCell

        let city = self.citiesArray[indexPath.row]
        cell.cityTableViewLabel.text = city.name
        cell.zipcodeTableViewLabel.text = city.zipCode

        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("DataSegue", sender: nil)
        
        
    }
    
    func geocoding(location: String, completion: (Double, Double) -> ()) {
        CLGeocoder().geocodeAddressString(location) {
            
            (placemarks, error) in
            
            if placemarks?.count > 0 {
                let placemark = placemarks?[0]
                let location = placemark!.location
                let coordinate = location?.coordinate
                completion((coordinate?.latitude)!, (coordinate?.longitude)!)
            }
        }
    }
 
}
