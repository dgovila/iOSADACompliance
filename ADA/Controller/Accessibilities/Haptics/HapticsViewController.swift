//
//  HapticsViewController.swift
//  ADA
//
//  Created by sharun on 13/07/21.
//

import UIKit

enum ButtonViewTags: Int {
    case sucessNotificationButton = 1,
    warningNotificationButton,
    errorNotificationButton,
    lightImpactButton,
    softImpactButton,
    mediumImpactButton,
    rigidImpactButton,
    heavyImpactButton
}

class HapticsViewController: UIViewController {
    
    @IBOutlet var stackView: UIStackView!
    let notificationGenerator = UINotificationFeedbackGenerator()
    let dataModel = HapticsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = dataModel.navigationTitle
        notificationGenerator.prepare()
        produceFeedbackLabels(labelText: NSAttributedString(string: dataModel.introductionLabel))
        produceFeedbackLabels(labelText: dataModel.prepareLabel)
        produceFeedbackLabels(labelText: dataModel.settingsLabel)
        produceUINotificationFeedbackGeneratorView()
        produceUIImpactFeedbackGeneratorView()
        produceUISelectionFeedbackGeneratorView()
    }
    
    /// This function is responsbile for producing the feedback buttons
    /// - Parameters:
    ///   - title: title for the button
    ///   - color: color for the button
    ///   - viewTag: viewTag for the button
    /// - Returns: Feedback Buttons
    private func produceFeedbackButtons(title: String, color: UIColor, viewTag: Int) -> UIButton {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.tag = viewTag
        button.addTarget(self, action: #selector(feedbackButtonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }
    
    /// This function is responsible for producing the labels for the feedback screen
    /// - Parameter labelText: Text for the label
    private func produceFeedbackLabels(labelText: NSAttributedString?) {
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = labelText
        stackView.addArrangedSubview(label)
    }
    
    /// This function is responsible for setting the stack view for the screen.
    /// - Parameters:
    ///   - axis: axis of the stack view
    ///   - elements: elements to be added to the stack view
    private func setStackViewElements(axis: NSLayoutConstraint.Axis, elements: [UIView]) {
        let childStackView = UIStackView()
        childStackView.spacing = 20
        childStackView.axis = axis
        for element in elements {
            childStackView.addArrangedSubview(element)
        }
        stackView.addArrangedSubview(childStackView)
    }
    
    @objc func feedbackButtonTapped(_ sender: Any) {
        let button = (sender as? UIButton)
        switch button?.tag {
        case ButtonViewTags.sucessNotificationButton.rawValue:
            notificationGenerator.notificationOccurred(.success)
        case ButtonViewTags.warningNotificationButton.rawValue:
            notificationGenerator.notificationOccurred(.warning)
        case ButtonViewTags.errorNotificationButton.rawValue:
            notificationGenerator.notificationOccurred(.error)
        case ButtonViewTags.lightImpactButton.rawValue:
            createImpactFeedback(style: .light)
        case ButtonViewTags.softImpactButton.rawValue:
            createImpactFeedback(style: .soft)
        case ButtonViewTags.mediumImpactButton.rawValue:
            createImpactFeedback(style: .medium)
        case ButtonViewTags.rigidImpactButton.rawValue:
            createImpactFeedback(style: .rigid)
        case ButtonViewTags.heavyImpactButton.rawValue:
            createImpactFeedback(style: .heavy)
        default:
            break
        }
    }
}

extension HapticsViewController {
    /// This function is responsible for producing the Notification Feedback Generator View
    private func produceUINotificationFeedbackGeneratorView() {
        produceFeedbackLabels(labelText: dataModel.notificationLabel)
        let successButton = produceFeedbackButtons(title: NotificationFeedbackType.success.rawValue.capitalized, color: UIColor.green, viewTag: ButtonViewTags.sucessNotificationButton.rawValue)
        let warningButton = produceFeedbackButtons(title: NotificationFeedbackType.warning.rawValue.capitalized, color: UIColor.yellow, viewTag: ButtonViewTags.warningNotificationButton.rawValue)
        let errorButton = produceFeedbackButtons(title: NotificationFeedbackType.error.rawValue.capitalized, color: UIColor.red, viewTag: ButtonViewTags.errorNotificationButton.rawValue)
        setStackViewElements(axis: .vertical, elements: [successButton, warningButton, errorButton])
    }
}

extension HapticsViewController {
    /// This function is responsible for producing the Impact Feedback Generator View
    private func produceUIImpactFeedbackGeneratorView() {
        produceFeedbackLabels(labelText: dataModel.impactLabel)
        let lightButton = produceFeedbackButtons(title: ImpactFeedbackType.light.rawValue.capitalized, color: UIColor.orange.withAlphaComponent(0.2), viewTag: ButtonViewTags.lightImpactButton.rawValue)
        let softButton = produceFeedbackButtons(title: ImpactFeedbackType.soft.rawValue.capitalized, color: UIColor.orange.withAlphaComponent(0.4), viewTag: ButtonViewTags.softImpactButton.rawValue)
        let mediumButton = produceFeedbackButtons(title: ImpactFeedbackType.medium.rawValue.capitalized, color: UIColor.orange.withAlphaComponent(0.6), viewTag: ButtonViewTags.mediumImpactButton.rawValue)
        let rigidButton = produceFeedbackButtons(title: ImpactFeedbackType.rigid.rawValue.capitalized, color: UIColor.orange.withAlphaComponent(0.8), viewTag: ButtonViewTags.rigidImpactButton.rawValue)
        let heavyButton = produceFeedbackButtons(title: ImpactFeedbackType.heavy.rawValue.capitalized, color: UIColor.orange.withAlphaComponent(1.0), viewTag: ButtonViewTags.heavyImpactButton.rawValue)
        setStackViewElements(axis: .vertical, elements: [lightButton, softButton, mediumButton, rigidButton, heavyButton])
    }
    
    /// This function is responsible for creating the impact feedback
    /// - Parameter style: Impact Feedback Style
    private func createImpactFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
}

extension HapticsViewController {
    /// This function is responsible for producing the Selection Feedback Generator View
    private func produceUISelectionFeedbackGeneratorView() {
        produceFeedbackLabels(labelText: dataModel.selectionLabel)
        let picker = UIDatePicker()
        picker.datePickerMode = UIDatePicker.Mode.date
        if #available(iOS 13.4, *) {
            // Added to keep the old date picker style on iOS versions >= 13.4.
            picker.preferredDatePickerStyle = .wheels
        }
        let size = self.view.frame.size
        picker.frame = CGRect(x: 0.0, y: size.height - 200, width: size.width, height: 200)
        stackView.addArrangedSubview(picker)
    }
}
