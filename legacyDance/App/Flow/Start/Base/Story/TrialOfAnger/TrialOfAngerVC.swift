//
//  TrialOfAngerVC.swift

import Foundation
import UIKit
import SnapKit

class TrialOfAngerVC: UIViewController {
    
    var contentView: TrialOfAngerView {
        view as? TrialOfAngerView ?? TrialOfAngerView()
    }
    
    override func loadView() {
        view = TrialOfAngerView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnIgnore.addTarget(self, action: #selector(goIgnore), for: .touchUpInside)
        contentView.btnSpeak.addTarget(self, action: #selector(goSpeak), for: .touchUpInside)
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
    }
    
    @objc func goIgnore() {
        let vc = IgnoreTheProvocationsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goSpeak() {
        let vc = SpeakPeacefullyVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
