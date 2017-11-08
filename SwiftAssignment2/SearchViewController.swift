//
//  Mobile Application Enterprise Development Assignment 2
//  Created by Gianni Anfiteatro
//  anfgy001
//  110169824
//

import UIKit

class SearchViewController : UIViewController {
    
    // all UI fields go here
    
    func configureView()
    {
        // Update the user interface for the detail item
        /*if let detail = self.detailItem
        {
            if let label = self.detailDescriptionLabel
            {
                label.text = detail.description
                imageView.image = detail
            }
        }*/
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        // screen size done here
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    var detailItem : UIImage?
    {
        didSet {
            // Update the view
            self.configureView()
        }
    }
}
