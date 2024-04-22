import UIKit
import ProjectCore

public final class SettingsSecondViewController: UIViewController {
    // MARK: - Views
    // MARK: - Instance properties
    // MARK: - Initialization

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupViewConfiguration()
    }

    // MARK: - Functions
}

// MARK: - ViewConfiguration

extension SettingsSecondViewController: ViewConfigurationProtocol {
    public func setupConstraints() {
    }

    public func buildViewHierarchy() {
    }

    public func configureViews() {
        view.backgroundColor = .yellow
    }
}
