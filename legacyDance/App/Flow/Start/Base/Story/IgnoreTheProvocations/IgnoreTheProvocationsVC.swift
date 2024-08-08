//
//  IgnoreTheProvocationsVC.swift


import Foundation
import UIKit
import SnapKit

class IgnoreTheProvocationsVC: UIViewController {
    
    var contentView: IgnoreTheProvocationsView {
        view as? IgnoreTheProvocationsView ?? IgnoreTheProvocationsView()
    }
    
    override func loadView() {
        view = IgnoreTheProvocationsView()
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
