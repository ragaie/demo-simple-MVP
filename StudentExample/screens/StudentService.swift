//
//  StudentService.swift
//  StudentExample
//
//  Created by Ragaie Alfy on 1/28/20.
//  Copyright © 2020 Ragaie Alfy. All rights reserved.
//

import Foundation

class StudentService {
    
    func itemData(complete : @escaping ([Student])->()){
        DispatchQueue.global(qos: .background).async {
            print("Run on background thread")
            let student1 = Student.init(firstName: "Ali", lastName: "Ahmed", birthDate: "1990-04-01")
                 let student2 = Student.init(firstName: "mohmed", lastName: "Ahmed", birthDate: "1992-04-01")
                 let student3 = Student.init(firstName: "hassan", lastName: "ali", birthDate: "1988-04-01")
                 let student4 = Student.init(firstName: "Ali", lastName: "Ahmed", birthDate: "1991-04-01")
                 
                 let itemArr = [student1,student2,student3,student4]
                 
            DispatchQueue.main.async {
                complete(itemArr)
            }
        }

     

    }
}
