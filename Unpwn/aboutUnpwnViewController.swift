//
//  aboutUnpwnViewController.swift
//  Storyboard_Unpwn
//
//  Created by Alessandro Borsato on 27/02/21.
//

import UIKit

class aboutUnpwnViewController: UIViewController {

    func openUrl(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func didTapSloth() {
        openUrl(urlStr: "https://github.com/Slthy/")
    }
    @IBAction func didTapHIBP() {
        openUrl(urlStr: "https://haveibeenpwned.com")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
