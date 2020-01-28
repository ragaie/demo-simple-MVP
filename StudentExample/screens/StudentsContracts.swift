//
//  StudentsContracts.swift
//  StudentExample
//
//  Created by Ragaie Alfy on 1/28/20.
//  Copyright © 2020 Ragaie Alfy. All rights reserved.
//

import Foundation


protocol StudentviewDelagate  : NSObjectProtocol{
    
    func showLoader()
    func hideLoader()
    func updateTableView(students :[Student])
}

protocol StudentPresenterDelagate {
    func getStudentDataList()
    func objectFormat(item : Student)->String
    
}
