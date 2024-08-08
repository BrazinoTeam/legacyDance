//
//  ReturnToTheFestivalVC.swift

import Foundation
import UIKit
import SnapKit

class ReturnToTheFestivalVC: UIViewController {
    
    var contentView: ReturnToTheFestivalView {
        view as? ReturnToTheFestivalView ?? ReturnToTheFestivalView()
    }
    
    override func loadView() {
        view = ReturnToTheFestivalView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnGo.addTarget(self, action: #selector(goNext), for: .touchUpInside)
    }
    
    @objc func goNext() {
        let vc = FinalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
