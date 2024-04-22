import UIKit
import ProjectCore

// MARK: - HomeTabSceneNavigationDelegate definition

public protocol HomeTabSceneNavigationDelegate: AnyObject {}

public final class HomeTabCoordinator: BaseCoordinator, TabItemCoordinator {
    // MARK: - Instance properties

    public var navigationController = UINavigationController()
    private weak var navigationDelegate: HomeTabSceneNavigationDelegate?

    // MARK: - Initialization

    public override init() {
        super.init()
        navigationDelegate = self
    }

    // MARK: - functions

    public override func start() {
        navigationController.pushViewController(HomeViewController(), animated: true)
    }
}

// MARK: - HomeTabSceneNavigationDelegate

extension HomeTabCoordinator: HomeTabSceneNavigationDelegate {}
