import UIKit
import Kingfisher
class ViewController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers(pages, animated: true)
        self.selectedViewController = pages[0]
        tabBar.backgroundColor = .gray
        FirebaseData().getData { dict in
            allProducts = getAllProudctInOneDict(dict: dict)
            allProductsByGroups = dict
    }
}
}
