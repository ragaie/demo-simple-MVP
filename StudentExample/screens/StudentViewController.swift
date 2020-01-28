//
//  StudentViewController.swift
//  StudentExample
//
//  Created by Ragaie Alfy on 1/28/20.
//  Copyright © 2020 Ragaie Alfy. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {

    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    @IBOutlet weak var studentsTableView: UITableView!
    var myPresenter : StudentPresenterDelagate?
    private var items : [Student] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        myPresenter = StudentPresenter.init(service: StudentService(), view: self)
        myPresenter?.getStudentDataList()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        studentsTableView.delegate = self
        studentsTableView.dataSource = self
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension StudentViewController : StudentviewDelagate{
    func showLoader() {
        loaderView.isHidden = false
    }
    
    func hideLoader() {
        loaderView.isHidden = true

    }
    
    func updateTableView(students: [Student]) {
        items = students
        studentsTableView.reloadData()
    }
    
    
}
extension StudentViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCellID", for: indexPath)
        cell.textLabel?.text = myPresenter?.objectFormat(item: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
