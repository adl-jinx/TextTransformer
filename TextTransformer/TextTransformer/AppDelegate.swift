//
//  AppDelegate.swift
//  TextTransformer
//
//  Created by Antonio De Luca on 19/05/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "a"
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSettings)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    
    @objc func showSettings() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vs = storyboard.instantiateController(withIdentifier: "ViewController") as?
                ViewController else {
            fatalError("Unable to find ViewController in the storyboard.")
        }
        
        guard let button = statusItem.button else {
            fatalError("Can't find status item button.")
        }
        
        let popoverView = NSPopover()
        popoverView.contentViewController = vs
        popoverView.behavior = .transient
        popoverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .maxY)
        
        
    }

}

