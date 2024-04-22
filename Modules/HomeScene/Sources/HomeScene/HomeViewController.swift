import UIKit
import ProjectCore

final class HomeViewController: UIViewController {
    // MARK: - Instance properties

    static var titleTabBarItem: String = {
        return "Home"
    }()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)

        setupNavigationInfo()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewConfiguration()
    }

    // MARK: - Functions

    /**
     Challenge: Adding images in a centralized file in the project.
     Open a pull request
     */
    private func setupNavigationInfo() {
        let tabSessionBarItem = UITabBarItem(title: HomeViewController.titleTabBarItem,
                                             image: UIImage(systemName: "house"),
                                             selectedImage: UIImage(systemName: "house.fill"))
        tabBarItem = tabSessionBarItem
        title = HomeViewController.titleTabBarItem
    }
}

// MARK: - ViewConfigurationProtocol

extension HomeViewController: ViewConfigurationProtocol {
    func setupConstraints() {}
    func buildViewHierarchy() {}

    func configureViews() {
        view.backgroundColor = .green
    }
}
