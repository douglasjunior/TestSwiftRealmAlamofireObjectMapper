//
//  ViewController.swift
//  TestRealm
//
//  Created by Douglas Nassif Roma Junior on 08/11/16.
//  Copyright © 2016 Douglas Nassif Roma Junior. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //testRealm();
        //testAlamofire();
        testAlamofireObjectMapper();

    }
    
    func testAlamofire(){
        print("\n\ntestAlamofire()");
        let url = "https://bitbucket.org/hyphe/blog-examples/raw/master/fetchData/demoapi/books";
        Alamofire.request(Method.GET,url)
            .responseJSON { response in
                print("Request: \(response.request)")  // original URL request
                print("Response: \(response.response)") // URL response
                print("Data: \(response.data)")     // server data
                print("Result: \(response.result)")   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
    
    func testAlamofireObjectMapper(){
        print("\n\ntestAlamofireObjectMapper");
        let url = "https://bitbucket.org/hyphe/blog-examples/raw/master/fetchData/demoapi/books";
        Alamofire.request(Method.GET,url)
            .responseArray { (response: Response<[Book], NSError>) in
                print("Request: \(response.request)");  // original URL request
                print("Response: \(response.response)"); // URL response
                print("Data: \(response.data)");     // server data
                print("Result: \(response.result)");   // result of response serialization
                
                let books = response.result.value;  // books array
                print("Books: \(books)");
            
                let realm = try! Realm();
                
                try! realm.write {
                    for book in books! {
                        realm.add(book, update: true);
                    }
                }
                
                let booksRealm = realm.objects(Book.self);
                
                print("BooksRealm: \(booksRealm)");
        }
    }
    
    func testRealm(){
        print("\n\ntestRealm()");
        let realm = try! Realm();
        
        let predicate = NSPredicate(format: "id = %ld", 1);
        var vehicle = realm.objects(Vehicle.self).filter(predicate).first;
        
        if vehicle == nil {
            print("Veículo não existe, criando...");
            vehicle = Vehicle();
            vehicle!.id = 1;
            vehicle!.model = "Camaro";
            vehicle!.year = 2016;
            
            try! realm.write {
                let wheel1 = getWheelFromRealm(realm, id: 1);
                let wheel2 = getWheelFromRealm(realm, id: 2);
                let wheel3 = getWheelFromRealm(realm, id: 3);
                let wheel4 = getWheelFromRealm(realm, id: 4);
                
                vehicle?.wheels.append(wheel1);
                vehicle?.wheels.append(wheel2);
                vehicle?.wheels.append(wheel3);
                vehicle?.wheels.append(wheel4);
                
                realm.add(vehicle!);
            }
        }
        
        try! realm.write {
            vehicle?.year = 2000;
        }
        
        print("Veículo: \(vehicle)");
    }
    
    func getWheelFromRealm(realm: Realm, id: Int) -> Wheel {
        // monta o where (predicate)
        let predicate = NSPredicate(format: "id = %ld", id);
        // faz a consullta
        var wheel = realm.objects(Wheel.self).filter(predicate).first;
        // se ainda não existe então cria
        if wheel == nil {
            wheel = Wheel();
            wheel!.id = id;
            wheel!.number = id;
            realm.add(wheel!);
        }
        return wheel!;
    }
}

