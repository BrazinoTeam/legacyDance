//
//  StartVC.swift


import Foundation
import UIKit
import SnapKit

class StartVC: UIViewController {
    

    var contentView: StartView {
        view as? StartView ?? StartView()
    }
    
    override func loadView() {
        view = StartView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layoutIfNeeded()
        animateProgressBar()
    }
    
    func animateProgressBar() {
        UIView.animate(withDuration: 1.5) {
            self.contentView.progressView.setProgress(1.0, animated: true)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                  self.goToBase()
    }
}
    
    func goToBase() {
         
                    let vc = BaseVC()
                    let navigationController = UINavigationController(rootViewController: vc)
                    navigationController.modalPresentationStyle = .fullScreen
                    present(navigationController, animated: true)
                    navigationController.setNavigationBarHidden(true, animated: false)
            }
    }
