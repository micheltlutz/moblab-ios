import UIKit

public protocol TabCoordinator: CoordinatorProtocol {
    var tabController: UITabBarController { get }

    func setup()
}

public extension TabCoordinator {
    func start(with url: URL?) {}
    func add(childCoordinator: CoordinatorProtocol) {}
    func remove(childCoordinator: CoordinatorProtocol) {}
}
