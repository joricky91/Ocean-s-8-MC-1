//
//  LocationDetailsViewController.swift
//  Oceans 8 MC 1
//
//  Created by Haris Fadhilah on 06/04/22.
//

import UIKit

class LocationDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
         // Make the navigation bar's title with red text.
         let appearance = UINavigationBarAppearance()
         appearance.configureWithOpaqueBackground()
         appearance.backgroundColor = UIColor.systemBackground
         appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
         navigationItem.standardAppearance = appearance
         navigationItem.scrollEdgeAppearance = appearance
         navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
