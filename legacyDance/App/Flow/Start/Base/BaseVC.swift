//
//  BaseVC.swift



import Foundation
import UIKit
import SnapKit

class BaseVC: UIViewController {
    
    
    var contentView: BaseView {
        view as? BaseView ?? BaseView()
    }
    
    override func loadView() {
        view = BaseView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateName()
        
    }
    
    private func updateName() {
        contentView.userName.text = "Welcome, \(Memory.shared.userName ?? "Welcome, User name!")"
    }
    
    private func selectBtn() {
        contentView.btnProfile.addTarget(self, action: #selector(goProfile), for: .touchUpInside)
        contentView.btnStart.addTarget(self, action: #selector(goStory), for: .touchUpInside)

    }
    
    @objc func goProfile() {
        let vc = ProfileVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goStory() {
        let vc = StoryVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
