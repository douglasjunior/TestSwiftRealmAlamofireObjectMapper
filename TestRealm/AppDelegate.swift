//
//  AppDelegate.swift
//  TestRealm
//
//  Created by Douglas Nassif Roma Junior on 08/11/16.
//  Copyright © 2016 Douglas Nassif Roma Junior. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        realmConfig();
        return true
    }
    
    func realmConfig(){
        var config = Realm.Configuration()
        
        // quando o banco mudar, é preciso incrementar o número da versão
        config.schemaVersion = 1;

        // altera o nome do arquivo do banco de dados.
        config.fileURL = config.fileURL!.URLByDeletingLastPathComponent!.URLByAppendingPathComponent("pareazul.realm")
        print("Realm fileURL: \(config.fileURL)");
        
        // configura para deletar o banco de dados em caso de mudança
        config.deleteRealmIfMigrationNeeded = true; // isso deve ser removido quando colocado em produção
        
        // algoritmo de migração
        config.migrationBlock = { migration, oldSchemaVersion in
            var oldVersion = oldSchemaVersion;
            print("Migration: \(migration), oldVersion: \(oldVersion)");
            // código de migração aqui
            
            if (oldVersion < 2) {
                // migra do 1 pro 2
                oldVersion += 1;
            }
            
            if (oldVersion < 3) {
                
                oldVersion += 1;
            }
            
            if (oldVersion < 4) {
                
                oldVersion += 1;
            }
        }
        
        // Set this as the configuration used for the default Realm
        Realm.Configuration.defaultConfiguration = config;
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

