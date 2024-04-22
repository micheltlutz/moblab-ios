import Foundation

// MARK: - CoordinatorProtocol

public protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }

    func start()
    func start(with url: URL?)
    func add(childCoordinator: CoordinatorProtocol)
    func remove(childCoordinator: CoordinatorProtocol)
}
