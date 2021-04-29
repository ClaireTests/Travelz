//
//  Date+Formatting.swift
//  Travelz
//
//  Created by claire.roughan on 28/04/2021.
//  Copyright © 2021 claire.roughan. All rights reserved.
//

import Foundation

extension Date {

    /**
    - Parameters: dateString and standard ISO 8601 format
    - returns: NSDate value
    */
    static func stringToDate(string: String , withFormat:String) -> NSDate  {
         let dateformatter = DateFormatter()
         dateformatter.dateFormat = withFormat
         return dateformatter.date(from: string)! as NSDate
     }
    
    /**
    - Parameters: NSDate
    - returns: dd MMM, yyyy formatted String 
    */
    static func dateToString(date: NSDate, withFormat:String) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = withFormat
        return dateformatter.string(from: date as Date)
    }


}
