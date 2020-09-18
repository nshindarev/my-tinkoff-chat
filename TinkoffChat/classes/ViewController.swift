//
//  ViewController.swift
//  TinkoffChat
//
//  Created by Shindarev Nikita on 18.09.2020.
//  Copyright © 2020 nshindarev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   private let isLogging = Bundle.main.object(forInfoDictionaryKey: "IS_LOGGING") as? Bool ?? false

       // MARK: - UIViewController lifecycle methods
       
       override func viewDidLoad() {
           super.viewDidLoad()
           if isLogging { print("ViewController event: " + #function) }
       }
       
       override func viewWillAppear(_ animated: Bool){
           super.viewWillAppear(animated)
           if isLogging { print("ViewController event: " + #function) }
       }
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           if isLogging { print("ViewController event: " + #function) }
       }
       override func viewWillLayoutSubviews() {
           super.viewWillLayoutSubviews()
           if isLogging { print("ViewController event: " + #function) }
       }
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           if isLogging { print("ViewController event: " + #function) }
       }
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           if isLogging { print("ViewController event: " + #function) }
       }
       override func viewDidDisappear(_ animated: Bool) {
           super.viewDidDisappear(animated)
           if isLogging { print("ViewController event: " + #function) }
       }
}
