//
//  TrialOfFearVC.swift


import Foundation
import UIKit
import SnapKit

class TrialOfFearVC: UIViewController {
    
    var contentView: TrialOfFearView {
        view as? TrialOfFearView ?? TrialOfFearView()
    }
    
    override func loadView() {
        view = TrialOfFearView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnFollow.addTarget(self, action: #selector(goFollow), for: .touchUpInside)
        contentView.btnMove.addTarget(self, action: #selector(goMove), for: .touchUpInside)
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
    }
    
    @objc func goFollow() {
        let vc = FollowTheLightVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goMove() {
        let vc = MoveByFeelVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
