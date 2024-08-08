//
//  MoveSlowlyAndCarefullyVC.swift


import Foundation
import UIKit
import SnapKit

class MoveSlowlyAndCarefullyVC: UIViewController {
    
    var contentView: MoveSlowlyAndCarefullyView {
        view as? MoveSlowlyAndCarefullyView ?? MoveSlowlyAndCarefullyView()
    }
    
    override func loadView() {
        view = MoveSlowlyAndCarefullyView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnGo.addTarget(self, action: #selector(goNext), for: .touchUpInside)
    }
    
    @objc func goNext() {
        let vc = TrialOfAngerVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
