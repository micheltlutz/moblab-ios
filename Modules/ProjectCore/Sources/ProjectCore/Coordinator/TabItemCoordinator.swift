import UIKit

public protocol TabItemCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    init()
}
