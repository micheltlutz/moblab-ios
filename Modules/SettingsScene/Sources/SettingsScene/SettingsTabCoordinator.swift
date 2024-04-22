import UIKit
import ProjectCore

public protocol SettingsSceneNavigationDelegate: AnyObject {
    func shouldOpenSettingsSecondScreen()
}

public final class SettingsTabCoordinator: BaseCoordinator, TabItemCoordinator {
    public var navigationController = UINavigationController()
    /*
     In this case I disabled the linter because in this example we do not have a delegate binding,
     which would be an external class to this coordinator, such as a Router
     */
    // swiftlint:disable weak_delegate
    private var navigationDelegate: SettingsSceneNavigationDelegate?

    // MARK: - Initialization

    public override init() {
        super.init()

        navigationDelegate = self
    }

    // MARK: - Functions

    public override func start() {
        let viewModel = SettingsViewModel(navigationDelegate: navigationDelegate)

        navigationController.pushViewController(SettingsViewController(viewModel: viewModel), animated: true)
    }
}

// MARK: - SettingsTabSceneNavigationDelegate

extension SettingsTabCoordinator: SettingsSceneNavigationDelegate {
    public func shouldOpenSettingsSecondScreen() {
        navigationController.pushViewController(SettingsSecondViewController(), animated: true)
    }
}
