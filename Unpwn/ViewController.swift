//
//  ViewController.swift
//  Storyboard_Unpwnd
//
//  Created by Alessandro Borsato on 26/02/21.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Unpwn"
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func didTapApi() {
        navigationController?.pushViewController(apiViewController(), animated: true)
    }
    @IBAction func didTapGenerator() {
        navigationController?.pushViewController(generatorViewController(), animated: true)
    }
    @IBAction func didTapAboutUnpwn() {
        guard let aboutUnpwnVC = storyboard?.instantiateViewController(identifier: "abouUnpwn") as? aboutUnpwnViewController else {
            return
        }
        present(aboutUnpwnVC, animated:  true)
    }
}

class apiViewController: UIViewController {

    let apiContentView = UIHostingController(rootView: apiView())
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Unpwn"
        // Do any additional setup after loading the view.
        addChild(apiContentView)
        view.addSubview(apiContentView.view)
        setupConstraints()
        
    }
    fileprivate func setupConstraints () {
        apiContentView.view.translatesAutoresizingMaskIntoConstraints = false
        apiContentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        apiContentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        apiContentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        apiContentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
}

class generatorViewController: UIViewController {

    let generatorContentView = UIHostingController(rootView: generatorView())
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Unpwn"
        // Do any additional setup after loading the view.
        addChild(generatorContentView)
        view.addSubview(generatorContentView.view)
        setupConstraints()
        
    }
    fileprivate func setupConstraints () {
        generatorContentView.view.translatesAutoresizingMaskIntoConstraints = false
        generatorContentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        generatorContentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        generatorContentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        generatorContentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
}

/*class aboutUnpwnViewController: UIViewController {


    override func viewDidLoad() {
        view.backgroundColor = .systemGray5
        self.title="Unpwn"
        
    }
    
}*/



