//
//  FollowTheLightVC.swift

import Foundation
import UIKit
import SnapKit

class FollowTheLightVC: UIViewController {
    
    var contentView: FollowTheLightView {
        view as? FollowTheLightView ?? FollowTheLightView()
    }
    
    override func loadView() {
        view = FollowTheLightView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnGo.addTarget(self, action: #selector(goNext), for: .touchUpInside)
    }
    
    @objc func goNext() {
        let vc = TrialOfDoubtVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
