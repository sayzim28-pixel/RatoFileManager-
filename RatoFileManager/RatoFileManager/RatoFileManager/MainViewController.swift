import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Cores Cyberpunk
    let neonGreen = UIColor(red: 0.0, green: 1.0, blue: 0.2, alpha: 1.0)
    let deepBlack = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    let darkGrey = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1.0)

    let tableView = UITableView()
    let statusLabel = UILabel()
    
    // Dados Simulados de Diretórios
    let directories = [
        "Root: /var/mobile/Containers/Data/",
        "Assets: /Library/Application Support/",
        "OBB: /Android/obb/com.game.data/",
        "Config: /Documents/settings.json",
        "Mod: /usr/bin/hacker_tools/",
        "System: /private/var/mobile/Media/"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    private func setupUI() {
        view.backgroundColor = deepBlack
        title = "86 RATO - FILE MANAGER"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: neonGreen]
        
        // Header/Status View
        let headerView = UIView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 60))
        headerView.backgroundColor = darkGrey
        view.addSubview(headerView)
        
        statusLabel.text = "SYSTEM STATUS: READY TO INJECT"
        statusLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 14)
        statusLabel.textColor = neonGreen
        statusLabel.textAlignment = .center
        statusLabel.frame = headerView.bounds
        headerView.addSubview(statusLabel)
        
        // Botão de Ação Hacker
        let injectButton = UIButton(type: .system)
        injectButton.setTitle("EXECUTE MOD INJECTION", for: .normal)
        injectButton.titleLabel?.font = UIFont(name: "CourierNewPS-BoldMT", size: 18)
        injectButton.setTitleColor(neonGreen, for: .normal)
        injectButton.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.2, alpha: 0.1)
        injectButton.layer.borderColor = neonGreen.cgColor
        injectButton.layer.borderWidth = 1.0
        injectButton.layer.cornerRadius = 5
        injectButton.addTarget(self, action: #selector(injectTapped), for: .touchUpInside)
        
        view.addSubview(injectButton)
        
        // Layout do Botão
        injectButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            injectButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            injectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            injectButton.widthAnchor.constraint(equalToConstant: 250),
            injectButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupTableView() {
        tableView.frame = CGRect(x: 0, y: 170, width: view.frame.width, height: view.frame.height - 250)
        tableView.backgroundColor = deepBlack
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }

    @objc func injectTapped() {
        let alert = UIAlertController(title: "COMMAND EXECUTED", message: "Injecting assets into target directory...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
        
        statusLabel.text = "STATUS: INJECTING..."
        statusLabel.textColor = .orange
    }

    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return directories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = darkGrey
        cell.textLabel?.text = " > \(directories[indexPath.row])"
        cell.textLabel?.textColor = neonGreen
        cell.textLabel?.font = UIFont(name: "CourierNewPS-BoldMT", size: 16)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// Extensão para facilitar a estilização de títulos
extension UINavigationController {
    var titleTextColor: UIColor {
        return .black // Placeholder para lógica de cor
    }
}

extension MainViewController {
    var titleTextColor: UIColor {
        return UIColor(red: 0.0, green: 1.0, blue: 0.2, alpha: 1.0)
    }
}
