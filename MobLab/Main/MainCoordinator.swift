import UIKit
import ProjectCore
//import ProjectFoundations
// Scenes - Para uma próxima Guida vamos melhorar estes pontos de import
import HomeScene
import SettingsScene

enum SceneNames: String, CaseIterable {
    case home
    case settings
    
    var referenceTabIndex: Int {
        guard let item = SceneNames.init(rawValue: rawValue) else { return 0 }
        
        switch item {
            case .home:
                return 0
            case .settings:
                return 1
        }
    }
}

enum MainChildCoordinator: Int, CaseIterable {
    case home = 0
    case settings

    var index: Int {
        return rawValue
    }
    
    var name: String {
        guard let item = MainChildCoordinator.init(rawValue: rawValue) else { return "home" }
        
        switch item {
            case .home:
                return "home"
            case .settings:
                return "settings"
        }
    }

    var coordinator: TabItemCoordinator.Type {
        guard let item = MainChildCoordinator.init(rawValue: rawValue) else { return HomeTabCoordinator.self }

        switch item {
        case .home:
            return HomeTabCoordinator.self

        case .settings:
            return SettingsTabCoordinator.self
        }
    }
}

final class MainCoordinator: TabCoordinator {
    // MARK: - Instance properties

    var childCoordinators: [CoordinatorProtocol] = []
    var tabController: UITabBarController = MainViewController()

    // MARK: - Initialization

    init() {
        setup()
    }

    // MARK: - Functions

    func setup() {
        var viewControllers: [UIViewController] = []

        childCoordinators.append(contentsOf: MainChildCoordinator.allCases.map { child in
            let coordinator = child.coordinator.init()
            coordinator.start()
            viewControllers.append(coordinator.navigationController)
            return coordinator
        })

        tabController.viewControllers = viewControllers
        tabController.selectedViewController = viewControllers.first
    }

    func start() {
        showTab(index: MainChildCoordinator.home.index)
    }
    
    func start(in scene: String) {
        guard let item = SceneNames.init(rawValue: scene) else {
            showTab(index: MainChildCoordinator.home.index)
            return
        }

        showTab(index: item.referenceTabIndex)
    }

    private func showTab(index: Int) {
        if let unwrapViewControllers = tabController.viewControllers {
            tabController.selectedViewController = unwrapViewControllers[index]
        }
    }
}
