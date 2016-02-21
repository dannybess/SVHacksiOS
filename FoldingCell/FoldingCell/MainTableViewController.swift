//
//  MainTableViewController.swift
//
// Copyright (c) 21/12/15. Ramotion Inc. (http://ramotion.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import MapKit

var typesArray : [String] = ["Uber", "Hotel", "Plane"]

class MainTableViewController: UITableViewController {
    
    let kCloseCellHeight: CGFloat = 179
    let kOpenCellHeight: CGFloat = 488

    let kRowsCount = 10
    
    var cellHeights = [CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCellHeightsArray()
        self.tableView.backgroundColor = UIColor.lightGrayColor()
    }
    
    // MARK: configure
    func createCellHeightsArray() {
        for _ in 0...kRowsCount {
            cellHeights.append(kCloseCellHeight)
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if cell is FoldingCell {
            let foldingCell = cell as! FoldingCell
            foldingCell.backgroundColor = UIColor.clearColor()
            
            if cellHeights[indexPath.row] == kCloseCellHeight {
                foldingCell.selectedAnimation(false, animated: false, completion:nil)
            } else {
                foldingCell.selectedAnimation(true, animated: false, completion: nil)
            }
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FoldingCell", forIndexPath: indexPath) as! DemoCell
        
        cell.returnTripLabel.hidden = true
        
        if(typesArray[indexPath.row] == "Hotel") {
            //First Side of Cell
            cell.uberEndAddress.hidden = false
            cell.uberHomeAddress.hidden = false
            cell.uberHomeAddress.text = "Ritz Carlton"
            cell.uberEndAddress.text = "1402 Carlton Way"
            cell.uberImageView.image = UIImage(named: "windows")
            cell.uberStartTime.text = "8:45 AM"
            cell.uberArrivalTime.text = "Check-in Time"
            cell.uberArrivalValue.text = "8:45 AM"
            cell.centerLabel.hidden = false
            cell.centerValue.hidden = false
            cell.centerLabel.text = "Room"
            cell.uberLine.hidden = false
            cell.centerValue.text = "412"
            //Second Side of Cell
            cell.topLabel.text = "Room"
            cell.underTopLabel.text = "412"
            cell.driverLabel.text = "Hotel Name"
            cell.underDriverLabel.text = "Ritz Carlton"
            cell.fromLabel.text = "Check-In"
            cell.underFromLabel.text = "8:45 AM"
            cell.toLabel.text = "Check-Out"
            cell.underToLabel.text = "9:25 AM"
            cell.arrivalTimeLabel.text = "Departure Time"
            cell.underArrivalTimeLabel.text = "8:40 AM"
            cell.underUnderArrivalTimeLabel.text = "Friday"
            
        }
        else if(typesArray[indexPath.row] == "Plane") {
            //First Side of Cell
            cell.uberImageView.image = UIImage(named: "shape")
            cell.uberEndAddress.hidden = false
            cell.uberHomeAddress.hidden = false
            cell.uberStartTime.text = "4:20 PM"
            cell.uberDate.text = "FRIDAY"
            cell.uberStartTime.text = "8:45 AM"
            cell.uberArrivalTime.text = "Gate"
            cell.uberArrivalValue.text = "A22"
            cell.uberHomeAddress.text = "San Francisco Intl."
            cell.uberEndAddress.text = "San Francisco, CA 94128"
            cell.centerLabel.hidden = true
            cell.centerValue.hidden = true
            cell.uberLine.hidden = false
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    // MARK: Table vie delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! FoldingCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
            cellHeights[indexPath.row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)

        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}
