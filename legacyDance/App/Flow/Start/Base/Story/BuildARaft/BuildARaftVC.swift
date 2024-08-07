//
//  BuildARaftVC.swift

import Foundation
import UIKit
import SnapKit

class BuildARaftVC: UIViewController {
    
    var contentView: BuildARaftView {
        view as? BuildARaftView ?? BuildARaftView()
    }
    
    override func loadView() {
        view = BuildARaftView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnGo.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
    }
    
    @objc func goNext() {
        let vc = FindingTheThreeSymbolsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
