//
//  ViewController.swift
//  SqlLiteDemo
//
//  Created by developer on 8/15/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if ((UserDefaults.standard.value(forKey: "firstTimeAddData") == nil))
        {
            self.localDatabase()
            UserDefaults.standard.set("enable", forKey: "firstTimeAddData")
        }
    }
    
    
    func localDatabase(){
        //Database varible
        var db: OpaquePointer?
        var stmt: OpaquePointer?
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("testingDB.sqlite")
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS myGuides (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS buyGuides (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,price NUMERIC)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        
        
        //the insert query
        let insertQueryBuyGuidesString = "INSERT INTO buyGuides (name,price) VALUES (?,?)"
        let insertQueryMyGuides = "INSERT INTO myGuides (name) VALUES (?)"
        for i in 0...4{
            
            switch i {
            case 0:
                //buy guides table
                if sqlite3_prepare(db, insertQueryBuyGuidesString, -1, &stmt, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error preparing insert: \(errmsg)")
                    return
                }
                if sqlite3_bind_text(stmt, 1, "demo1", -1, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                
                
                
                if sqlite3_bind_double(stmt, 2, Double(5.0)) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                
                if sqlite3_step(stmt) != SQLITE_DONE {
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure inserting hero: \(errmsg)")
                    return
                }
                
                //my guides table
                if sqlite3_prepare(db, insertQueryMyGuides, -1, &stmt, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error preparing insert: \(errmsg)")
                    return
                }
                if sqlite3_bind_text(stmt, 1, "name1", -1, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                if sqlite3_step(stmt) != SQLITE_DONE {
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure inserting hero: \(errmsg)")
                    return
                }
                
            case 1:
                
                //buy guides table insert values
                if sqlite3_prepare(db, insertQueryBuyGuidesString, -1, &stmt, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error preparing insert: \(errmsg)")
                    return
                }
                if sqlite3_bind_text(stmt, 1, "demo2", -1, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                
                
                
                if sqlite3_bind_double(stmt, 2, Double(6.0)) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                
                if sqlite3_step(stmt) != SQLITE_DONE {
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure inserting hero: \(errmsg)")
                    return
                }
                
                //my guides table insert values
                if sqlite3_prepare(db, insertQueryMyGuides, -1, &stmt, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error preparing insert: \(errmsg)")
                    return
                }
                if sqlite3_bind_text(stmt, 1, "name2", -1, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                if sqlite3_step(stmt) != SQLITE_DONE {
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure inserting hero: \(errmsg)")
                    return
                }
                
            case 2:
                if sqlite3_prepare(db, insertQueryBuyGuidesString, -1, &stmt, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error preparing insert: \(errmsg)")
                    return
                }
                if sqlite3_bind_text(stmt, 1, "demo3", -1, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                
                
                
                if sqlite3_bind_double(stmt, 2, Double(2.0)) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                
                if sqlite3_step(stmt) != SQLITE_DONE {
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure inserting hero: \(errmsg)")
                    return
                }
                
            case 3:
                if sqlite3_prepare(db, insertQueryBuyGuidesString, -1, &stmt, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error preparing insert: \(errmsg)")
                    return
                }
                if sqlite3_bind_text(stmt, 1, "dmeo4", -1, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                
                
                
                if sqlite3_bind_double(stmt, 2, Double(8.0)) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                
                if sqlite3_step(stmt) != SQLITE_DONE {
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure inserting hero: \(errmsg)")
                    return
                }
            case 4:
                if sqlite3_prepare(db, insertQueryBuyGuidesString, -1, &stmt, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error preparing insert: \(errmsg)")
                    return
                }
                if sqlite3_bind_text(stmt, 1, "demo5", -1, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                
                if sqlite3_bind_double(stmt, 2, Double(7.0)) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure binding name: \(errmsg)")
                    return
                }
                
                if sqlite3_step(stmt) != SQLITE_DONE {
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("failure inserting hero: \(errmsg)")
                    return
                }
                
            default:
                print("hi")
            }
            
        }
        
    }

  

}

