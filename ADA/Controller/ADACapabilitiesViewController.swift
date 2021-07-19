//
//  ADACapabilitiesViewController.swift
//  ADA
//
//  Created by Govila, Dhruv on 29/03/21.
//

import UIKit

class AccessibilityDetailsCell: UITableViewCell {
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerDescriptionLabel: UILabel!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

class ADACapabilitiesViewController: UIViewController {
    var adaCapabilites = [
        "Voice Over",
        "Haptics",
        "Designed with Dynamic Font Sizing"
    ]
}

extension ADACapabilitiesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return adaCapabilites.count
        default:
            break
        }
        return adaCapabilites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "iOSAccessibilityDetailsCell") as? AccessibilityDetailsCell else {
                return UITableViewCell()
            }
            cell.headerTitleLabel.font = OpenSans.bold.of(textStyle: .largeTitle)
            cell.headerDescriptionLabel.font = OpenSans.regular.of(textStyle: .body)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccessibilityOptionCell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = adaCapabilites[indexPath.row]
            cell.textLabel?.font = OpenSans.regular.of(textStyle: .body)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ADACapabilitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            moveToVoiceOverController()
        case 1:
            moveToHapticsViewController()
        case 2:
            moveToDynamicFontViewController()
        default:
            break
        }
    }
    
    private func moveToVoiceOverController() {
        let controllerStoryboardID = String(describing: VoiceOverViewController.self)
        if let controller = storyboard?.instantiateViewController(identifier: controllerStoryboardID) {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    private func moveToDynamicFontViewController() {
        let controllerStoryboardID = String(describing: DynamicFontViewController.self)
        if let controller = storyboard?.instantiateViewController(identifier: controllerStoryboardID) {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    private func moveToHapticsViewController() {
        let controllerStoryboardID = String(describing: HapticsViewController.self)
        if let controller = storyboard?.instantiateViewController(identifier: controllerStoryboardID) {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
