import UIKit
class ViewController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers(pages, animated: true)
        self.selectedViewController = pages[0]
        self.tabBar.backgroundColor = .systemGreen
    }
}
