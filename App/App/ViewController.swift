//
//  ViewController.swift
//  App
//
//  Created by tao on 2022/3/1.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func flutterButtonAction(_ sender: Any) {
        let engine = FlutterEngine(name: "App")
        engine.run()
        let vc = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        if let engine = vc.engine {
            GeneratedPluginRegistrant.register(with: engine)
        }
        self.present(vc, animated: true, completion: nil)
    }
    
}

