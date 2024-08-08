//
//  TrialOfDoubtVC.swift

import Foundation
import UIKit
import SnapKit

class TrialOfDoubtVC: UIViewController {
    
    var contentView: TrialOfDoubtView {
        view as? TrialOfDoubtView ?? TrialOfDoubtView()
    }
    
    override func loadView() {
        view = TrialOfDoubtView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnSlowly.addTarget(self, action: #selector(goSlowly), for: .touchUpInside)
        contentView.btnQuickly.addTarget(self, action: #selector(goQuickly), for: .touchUpInside)
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
    }
    
    @objc func goSlowly() {
        let vc = MoveSlowlyAndCarefullyVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goQuickly() {
        let vc = MoveQuicklyAndDecisivelyVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
