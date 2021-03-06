//
//  ViewController.swift
//  Map
//
//  Created by Heejae on 2022/06/05.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }

    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle:String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!,
            completionHandler: {
                (placemarks, error) -> Void in
                let pm = placemarks!.first
                let contry = pm!.country
                var address: String = contry!
                if pm!.location != nil {
                    address += " "
                    address += pm!.locality!
                }
                if pm!.thoroughfare != nil {
                    address += " "
                    address += pm!.thoroughfare!
                }
                
                self.lblLocationInfo1.text = "?????? ??????"
                self.lblLocationInfo2.text = address
            })
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.475218, longitudeValue: 126.965910, delta: 0.001, title: "?????????", subtitle: "??????????????? ????????? ??????2??? 15-4")
            self.lblLocationInfo1.text = "???????????? ??????"
            self.lblLocationInfo2.text = "????????? ?????????"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.511360, longitudeValue: 127.066529, delta: 0.01, title: "??????", subtitle: "??????????????? ????????? ??????1??? 171-2")
            self.lblLocationInfo1.text = "???????????? ??????"
            self.lblLocationInfo2.text = "?????????????????? ????????????"
        }
        
    }
    
}

