import UIKit
import Kingfisher
import SnapKit
class ViewController : UITabBarController, ProductsPresenterDelegate {    
    func presentProducts(dict: Dictionary<String, Array<ProductCard>>, allPoints : [Point]) {
        let home = HomeViewController()
        let productsPage = ProductsPageController()
        productsPage.dict = dict
        let mapPage = MapPageController()
        mapPage.allPoints = allPoints
        let cartPage = CartController()
        cartPage.dict = dict
        let pages = [home,productsPage,mapPage,cartPage]
        self.setViewControllers(pages, animated: true)
        self.selectedViewController = pages[0]
        tabBar.backgroundColor = .gray
    }
    func errorHandler() {
        print("error handler in action")
        let scroll = UIScrollView()
        let refreshControl : UIRefreshControl = {
           let control = UIRefreshControl()
            control.addTarget(self, action: #selector(reloadAll(sender:)), for: .valueChanged)
            control.tintColor = .white
            return control
        }()
        scroll.refreshControl = refreshControl
        scroll.backgroundColor = .black
        view.addSubview(scroll)
        scroll.snp.makeConstraints { make in
            make.left.right.top.bottom.width.height.equalToSuperview()
        }
    }
    
    private let presenter = ProductsPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setDelegate(delegate: self)
        presenter.fetchData()
    }
    @objc func reloadAll(sender : UIRefreshControl){
        view.subviews.forEach({ $0.removeFromSuperview() })
        presenter.fetchData()
    }
}
