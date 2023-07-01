import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let button = UIButton(type: .system)
        button.frame = CGRect(origin: CGPoint(x: 120, y: 370), size: CGSize(width: 150, height: 50))
        button.setTitle("Go to Post", for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.layer.cornerRadius = 20
        view.addSubview(button)
        button.addTarget(self, action: #selector(goToPost), for: .touchUpInside)
    }
    
    @objc func goToPost() {
        let postViewController = PostViewController()
        postViewController.title = title
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
