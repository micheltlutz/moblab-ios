import Foundation

public protocol SettingsViewModelProtocol {
    func openSettingsSecondScreenAction()
}

public final class SettingsViewModel: SettingsViewModelProtocol {
    private weak var navigationDelegate: SettingsSceneNavigationDelegate?

    public init(navigationDelegate: SettingsSceneNavigationDelegate? = nil) {
        self.navigationDelegate = navigationDelegate
    }

    public func openSettingsSecondScreenAction() {
        navigationDelegate?.shouldOpenSettingsSecondScreen()
    }
}
