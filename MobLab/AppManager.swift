import UIKit

/// AppManager
final class AppManager: NSObject {
    private let window: UIWindow

    private lazy var rootViewController: UINavigationController = {
        let navigationController = UINavigationController()

        return navigationController
    }()

    // MARK: - Initialization

    init(window: UIWindow) {
        self.window = window

        super.init()

        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }

    // MARK: - Functions

    func start() {
        startMainCoordinator(with: nil)
    }
    
    /**
        Author Important Note:
         To reduce complexity in this article, we will just validate the path and direct it to the destination coordinator. For production applications,
         I recommend that you carry out more accurate control of the url that is coming, to guarantee the security of the application.
     */
    func start(with url: URL) {
        let path = url.lastPathComponent
        print("PATH: \(path)")
        
        if path == "settings" {
            startMainCoordinator(with: path)
        } else {
            startMainCoordinator(with: nil)
        }
    }

    private func startMainCoordinator(with path: String?) {
        let mainCoordinator = MainCoordinator()
        if let scenePath = path {
            mainCoordinator.start(in: scenePath)
        } else {
            mainCoordinator.start()
        }

        self.window.rootViewController = mainCoordinator.tabController
    }
}
