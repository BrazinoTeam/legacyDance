//
//  MoveByFeelVC.swift

import Foundation
import UIKit
import SnapKit

class MoveByFeelVC: UIViewController {
    
    var contentView: MoveByFeelView {
        view as? MoveByFeelView ?? MoveByFeelView()
    }
    
    override func loadView() {
        view = MoveByFeelView()
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
