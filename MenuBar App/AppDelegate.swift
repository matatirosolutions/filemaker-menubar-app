//
//  AppDelegate.swift
//  FileMaker Menu
//
//  Created by Steve Winter on 13/02/2020.
//  Copyright © 2020 Steve Winter. All rights reserved.
//
import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.squareLength)
        statusBarItem.button?.image = NSImage(named:NSImage.Name("icon"))

        let statusBarMenu = NSMenu(title: "FileMaker Menu")
        statusBarItem.menu = statusBarMenu

        // client one
        let clientOneMenuItem = statusBarMenu.addItem(withTitle:"Client One", action:nil, keyEquivalent:"")
        let clientOneMenu = NSMenu(title: "Client One")
        clientOneMenu.addItem(
            withTitle: "DB One",
            action: #selector(AppDelegate.clientOne(_:)),
            keyEquivalent: ""
        )
        clientOneMenu.addItem(
            withTitle: "DB Two",
            action: #selector(AppDelegate.clientOne(_:)),
            keyEquivalent: ""
        )
        clientOneMenu.addItem(
            withTitle: "Another DB",
            action: #selector(AppDelegate.clientOne(_:)),
            keyEquivalent: ""
        )
        statusBarMenu.setSubmenu(clientOneMenu, for: clientOneMenuItem)
        
        // Client two
        let clientTwoMenuItem = statusBarMenu.addItem(withTitle:"Client Two", action:nil, keyEquivalent:"")
        let clientTwoMenu = NSMenu(title: "Client Two")
        clientTwoMenu.addItem(
            withTitle: "Interface",
            action: #selector(AppDelegate.clientTwo(_:)),
            keyEquivalent: ""
        )
        clientTwoMenu.addItem(
            withTitle: "Data",
            action: #selector(AppDelegate.clientTwo(_:)),
            keyEquivalent: ""
        )
        // Add a separator in the list
        clientTwoMenu.addItem(NSMenuItem.separator())
        clientTwoMenu.addItem(
            withTitle: "Web",
            action: #selector(AppDelegate.clientTwo(_:)),
            keyEquivalent: ""
        )
        clientTwoMenu.addItem(
            withTitle: "DataAPI",
            action: #selector(AppDelegate.clientTwo(_:)),
            keyEquivalent: ""
        )
        statusBarMenu.setSubmenu(clientTwoMenu, for: clientTwoMenuItem)
        
        // Client three
        let clientThreeMenuItem = statusBarMenu.addItem(withTitle:"Client Three", action:nil, keyEquivalent:"")
        let clientThreeMenu = NSMenu(title: "Client Three")
        clientThreeMenu.addItem(
            withTitle: "Our specific file",
            action: #selector(AppDelegate.specificFile(_:)),
            keyEquivalent: ""
        )
        statusBarMenu.setSubmenu(clientThreeMenu, for: clientThreeMenuItem)
        
        statusBarMenu.addItem(NSMenuItem.separator())
        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: ""
        )
    }

    @objc func clientOne(_ sender: NSMenuItem) {
        // URL encode the spaces in the file names
        let param = sender.title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "fmp://fms.clientone.com/" + param! + ".fmp12")!
        NSWorkspace.shared.open(url)
    }

    @objc func clientTwo(_ sender: NSMenuItem) {
        // Add a prefix to every file
        let url = URL(string: "fmp://fms.clienttwo.com/client_" + sender.title + ".fmp12")!
        NSWorkspace.shared.open(url)
    }
    
    @objc func specificFile(_ sender: NSMenuItem) {
        let url = URL(string: "fmp://fms.someclient.com/aSpecificFile.fmp12")!
        NSWorkspace.shared.open(url)
    }
}
