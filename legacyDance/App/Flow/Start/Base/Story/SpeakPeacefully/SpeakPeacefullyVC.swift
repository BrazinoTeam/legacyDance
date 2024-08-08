//
//  SpeakPeacefullyVC.swift



import Foundation
import UIKit
import SnapKit

class SpeakPeacefullyVC: UIViewController {
    
    var contentView: SpeakPeacefullyView {
        view as? SpeakPeacefullyView ?? SpeakPeacefullyView()
    }
    
    override func loadView() {
        view = SpeakPeacefullyView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnGo.addTarget(self, action: #selector(goNext), for: .touchUpInside)
    }
    
    @objc func goNext() {
        let vc = TempleOfTheTigerSpiritVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
