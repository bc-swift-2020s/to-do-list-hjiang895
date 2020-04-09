//
//  LocalNotificationManager.swift
//  To Do List
//
//  Created by Hannah Jiang on 4/9/20.
//  Copyright © 2020 Hannah Jiang. All rights reserved.
//

import UIKit
import UserNotifications

struct LocalNotificationManager {
    
    static func authorizeLocalNotifications(viewController: UIViewController) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard error == nil else {
                print("ERROR: \(error!.localizedDescription)")
                return
            }
            if granted {
                print("Notifications Authorization Granted!")
            } else {
                print("The user has denied notifications")
                DispatchQueue.main.async {
                    viewController.oneButtonAlert(title: "User Has Not Allowed Notifications", message: "To receive alerts for reminders, open the Settings app, select To Do List > Notifications > Allow Notifications")
                    
                }
            }
        }
    }
    
    static func isAuthorized(completed: @escaping (Bool)->()) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard error == nil else {
                print("ERROR: \(error!.localizedDescription)")
                completed(false)
                return
            }
            if granted {
                print("Notifications Authorization Granted!")
                completed(true)
            } else {
                print("The user has denied notifications")
                completed(false)
                
            }
        }
    }
    
    static func setCalendarNotifications(title: String, subtitle: String, body: String, badgeNumber: NSNumber?, sound: UNNotificationSound?, date: Date) -> String {
        //create content
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.badge = badgeNumber
        content.sound = sound
        
        //create trigger
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        dateComponents.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //creat request
        let notificationID = UUID().uuidString
        let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
        
        //register request with the notificaton center
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription). Adding notification request went wrong.")
            }else {
                print("Notification scheduled \(notificationID), title: \(content.title)")
            }
            
        }
        return notificationID
    }
    
    
}
