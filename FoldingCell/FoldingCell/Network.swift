//
//  Netowrk.swift
//  FoldingCell
//
//  Created by Patrick Li on 2/21/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import Foundation


class Network {


    public func postToServer(withUserId : String) {

    }

    public func getContentFromServr(withUserId : String) {

        request(.GET, "https://radiant-plains-34333.herokuapp.com/candidate/\(withUserId).json", parameters: nil).responseJSON {
            response in
            print("hello")
            print(response)
            
            
        }

    }
    
}

