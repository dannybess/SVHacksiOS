//
//  DemoCell.swift
//  FoldingCell
//
//  Created by Alex K. on 25/12/15.
//  Copyright © 2015 Alex K. All rights reserved.
//

import UIKit
import MapKit

class DemoCell: FoldingCell, MKMapViewDelegate {
    
    @IBOutlet weak var mapView1: MKMapView!
    @IBOutlet weak var uberEndAddress: UILabel!
    @IBOutlet weak var uberHomeAddress: UILabel!
    @IBOutlet weak var uberImageView: UIImageView!
    @IBOutlet weak var uberDate: UILabel!
    @IBOutlet weak var uberStartTime: UILabel!
    @IBOutlet weak var uberArrivalValue: UILabel!
    @IBOutlet weak var uberArrivalTime: UILabel!
    @IBOutlet weak var uberLine: UIView!    
    @IBOutlet weak var centerValue: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var sideColor: UIView!
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var underTopLabel: UILabel!
    @IBOutlet weak var underDriverLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var underFromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var underToLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var underArrivalTimeLabel: UILabel!
    @IBOutlet weak var underUnderArrivalTimeLabel: UILabel!
    @IBOutlet weak var returnTripLabel: UILabel!
    
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var arrowImage1: UIImageView!
    override func awakeFromNib() {
        
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        self.mapView1.delegate = self
        let annotation = MKPointAnnotation()
        //37.411461, -122.031090
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.411461, longitude: -122.031090)
        self.mapView1.zoomEnabled = true
        self.mapView1.addAnnotation(annotation)
        
        super.awakeFromNib()
    }
    
    override func animationDuration(itemIndex:NSInteger, type:AnimationType)-> NSTimeInterval {
     
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }

}
