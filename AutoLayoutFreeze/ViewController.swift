import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        print("\(#function)")
        print("self.view.safeAreaInsets: \(self.view.safeAreaInsets)")
        print("self.additionalSafeAreaInsets: \(self.additionalSafeAreaInsets)")
        print("self.view.layoutMargins: \(self.view.layoutMargins)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\(#function)")
        print("self.view.safeAreaInsets: \(self.view.safeAreaInsets)")
        print("self.additionalSafeAreaInsets: \(self.additionalSafeAreaInsets)")
        print("self.view.layoutMargins: \(self.view.layoutMargins)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        print("\(#function)")
        print("UIScreen.main.bounds : \(UIScreen.main.bounds), UIScreen.main.scale: \(UIScreen.main.scale)")
        print("self.view.safeAreaInsets: \(self.view.safeAreaInsets)")
        print("self.additionalSafeAreaInsets: \(self.additionalSafeAreaInsets)")
        print("self.view.layoutMargins: \(self.view.layoutMargins)")
        
        // freeze if view.insetsLayoutMarginsFromSafeArea
        //view.insetsLayoutMarginsFromSafeArea = false
        
        let scrollView = UIScrollView()
        scrollView.accessibilityIdentifier = "scrollView"
        scrollView.preservesSuperviewLayoutMargins = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.view.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        self.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        let contentView = UIView()
        contentView.accessibilityIdentifier = "contentView"
        contentView.backgroundColor = UIColor.blue
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.preservesSuperviewLayoutMargins = true
        scrollView.addSubview(contentView)
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.green
        v1.accessibilityIdentifier = "v1"
        v1.translatesAutoresizingMaskIntoConstraints = false
        v1.preservesSuperviewLayoutMargins = true
        contentView.addSubview(v1)
        v1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: v1.trailingAnchor, constant: 0).isActive = true
        // freeze if constant > (UIScreen.main.bounds.height - 34 - 8) // iPhoneXS: 770
        v1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 900).isActive = true
        // freeze if `constant` + `v1.layoutMargins.bottom(=8)` is 1 ~ 34
        contentView.bottomAnchor.constraint(equalTo: v1.bottomAnchor, constant: 1).isActive = true
        
        let v2 = UIView()
        v2.accessibilityIdentifier = "v2"
        v2.backgroundColor = UIColor.red
        v2.translatesAutoresizingMaskIntoConstraints = false
        v2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        contentView.addSubview(v2)
        v2.leadingAnchor.constraint(equalTo: v1.leadingAnchor).isActive = true
        v1.trailingAnchor.constraint(equalTo: v2.trailingAnchor).isActive = true
        v2.topAnchor.constraint(equalTo:v1.topAnchor).isActive = true
        v1.layoutMarginsGuide.bottomAnchor.constraint(equalTo:v2.bottomAnchor).isActive = true
    }
}

