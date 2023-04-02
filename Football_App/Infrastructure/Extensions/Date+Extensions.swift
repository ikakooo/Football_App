//
//  Date+Extensions.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import Foundation

extension Date {
 var millisecondsSince1970: Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
        //RESOLVED CRASH HERE
    }

    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}
