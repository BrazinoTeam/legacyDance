//
//  MoveQuicklyAndDecisivelyVC.swift


import Foundation
import UIKit
import SnapKit

class MoveQuicklyAndDecisivelyVC: UIViewController {
    
    var contentView: MoveQuicklyAndDecisivelyView {
        view as? MoveQuicklyAndDecisivelyView ?? MoveQuicklyAndDecisivelyView()
    }
    
    override func loadView() {
        view = MoveQuicklyAndDecisivelyView()
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
