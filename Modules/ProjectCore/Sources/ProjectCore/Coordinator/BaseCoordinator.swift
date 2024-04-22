import Foundation

open class BaseCoordinator: CoordinatorProtocol {
    open var childCoordinators: [CoordinatorProtocol] = []

    public init() { }

    open func start() {
        start(with: .none)
    }

    open func start(with url: URL?) { }

    open func add(childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }

    open func remove(childCoordinator: CoordinatorProtocol) {
        self.childCoordinators.removeAll { $0 === childCoordinator }
    }
}
