import UIKit
import ProjectCore

public final class SettingsViewController: UIViewController {
    // MARK: - Views

    private let secondScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to second screen", for: .normal) // Mostrar como criar

        return button
    }()

    // MARK: - Instance properties

    private let viewModel: SettingsViewModelProtocol
    static var titleTabBarItem: String = {
        return "Settings"
    }()

    // MARK: - Initialization

    public init(viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        setupNavigationInfo()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupViewConfiguration()
        setupActions()
    }

    // MARK: - Functions

    private func setupNavigationInfo() {
        let tabSessionBarItem = UITabBarItem(title: SettingsViewController.titleTabBarItem,
                                             image: UIImage(systemName: "gearshape"),
                                             selectedImage: UIImage(systemName: "gearshape.fill"))
        tabBarItem = tabSessionBarItem
        title = SettingsViewController.titleTabBarItem
    }

    private func setupActions() {
        secondScreenButton.addTarget(self, action: #selector(secondScreenButtonAction), for: .touchUpInside)
    }

    @objc
    private func secondScreenButtonAction() {
        viewModel.openSettingsSecondScreenAction()
    }
}

// MARK: - ViewConfigurationProtocol

extension SettingsViewController: ViewConfigurationProtocol {
    public func setupConstraints() {
        secondScreenButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            secondScreenButton.heightAnchor.constraint(equalToConstant: 40),
            secondScreenButton.widthAnchor.constraint(equalToConstant: 200),
            secondScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondScreenButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    public func buildViewHierarchy() {
        view.addSubview(secondScreenButton)
    }

    public func configureViews() {
        view.backgroundColor = .systemPink
    }
}
