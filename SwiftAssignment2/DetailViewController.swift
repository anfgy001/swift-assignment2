//
//  Mobile Application Enterprise Development Assignment 2
//  Created by Gianni Anfiteatro
//  anfgy001
//  110169824
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var pageLabel: UILabel!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var detailNavigationItem: UINavigationItem!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
                imageView.image = detail
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        let screenSize = UIScreen.main.bounds;
        let screenWidth = screenSize.width;
        //var thePageLabel = pageLabel.text!;
        //pageLabel.center.x = screenWidth / 2;
        //imageView.center.x = screenWidth / 2;
        
        //if (DetailViewController)
        
        
        //detailDescriptionLabel.center.x = screenWidth / 2;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: UIImage? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

