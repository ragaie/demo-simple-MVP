//
//  StudentPresenter.swift
//  StudentExample
//
//  Created by Ragaie Alfy on 1/28/20.
//  Copyright © 2020 Ragaie Alfy. All rights reserved.
//

import UIKit

class StudentPresenter: NSObject{
    weak var viewDelegate : StudentviewDelagate?
    var myService : StudentService?
    override init() {
        super.init()
    }
    
    init(service : StudentService, view  : StudentviewDelagate){
        myService = service
        viewDelegate = view
    }
}

extension StudentPresenter : StudentPresenterDelagate{
    func objectFormat(item: Student) -> String {
        var formatedString = item.firstName ?? ""
        formatedString += " "
        formatedString += item.lastName ?? ""
        formatedString += ","
        formatedString += getDate(bitrhDate: item.birthDate ?? "") ?? "" 
        //give age not date
        return formatedString
    }
    
    func getDate(bitrhDate : String) -> String? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "YYYY-MM-dd"
        let dateOfBirth = dateFormater.date(from: bitrhDate)

        let calender = Calendar.current

        let dateComponent = calender.dateComponents([.year, .month, .day], from:
        dateOfBirth!, to: Date())

        return "\(dateComponent.year ?? 0)"
        
    }
    
    func getStudentDataList() {
        viewDelegate?.showLoader()
        myService?.itemData(complete: { (items) in
            //this things should call in main thread if service call happpen in background thread
            self.viewDelegate?.hideLoader()
            self.viewDelegate?.updateTableView(students: items)
        })
    }
}
