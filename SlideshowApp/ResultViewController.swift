//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 貞松優海 on 2023/12/09.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var enlargedImageView: UIImageView!
    var selectedImage: UIImage? // Change from UIImageView to UIImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display the selected image
        enlargedImageView.image = selectedImage
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


