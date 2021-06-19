//
//  UITappableLabel.swift
//  testing
//
//  Created by Ali Maher on 4/25/21.
//

import UIKit

public typealias CompletionHandler = () -> Void


open class UITappableLabel: UILabel {
    ///Dictionary containing the word and action that the user enterd
    private lazy var wordsActionDic: Dictionary<String, CompletionHandler> = Dictionary<String, CompletionHandler>()
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Public Methods
    
    
    ///This function is used to add an action if the user did tap on a specific word
    /// - Parameters:
    ///   - word: The word the user can tap
    ///   - action: the action you want to make when tapping the word
    func tap(word: String, action : @escaping CompletionHandler){
        guard !word.trim().isEmpty else {return}
        wordsActionDic[word] = action
    }
    
    
    /// This function is used to add an action if the user did tap on a specific word with the option of adding an underline or color
    /// - Parameters:
    ///   - word: The word the user can tap
    ///   - textColor: text color for word
    ///   - action: the action you want to make when tapping the word
    func tap(word: String ,underLine : Bool = false, textColor: UIColor? = .black, font: UIFont? = nil ,action : @escaping CompletionHandler){
//        guard !word.trim().isEmpty else {return}
        guard let text = text else {return}
        let attriString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: word)
        if underLine {
            attriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        }

        if let textColor = textColor {
            attriString.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: range)
        }
        if let font = font {
            attriString.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        }
        self.attributedText = attriString
        wordsActionDic[word] = action
    }
    
    // MARK: - Private Methods
    
    //Setuping the UILabel
    private func setup(){
        self.lineBreakMode = .byWordWrapping
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
    }
    
    
    ///The Gesture recognizer listener
    @objc private func tapLabel(gesture: UITapGestureRecognizer) {
        didTapLabel(gesture: gesture)
    }
    
    
    ///Catching the tapping action of user
    /// - Parameters:
    ///     - gesture: Is the gesture recognizer from the listener
    private func didTapLabel(gesture: UITapGestureRecognizer){
        for (word,action) in wordsActionDic {
            let range = (text! as NSString).range(of: word)
            let tapLocation = gesture.location(in: self)
            let index = self.indexOfChar(point: tapLocation)
            if index > range.location && index < range.location + range.length {
                action()
            }
        }
    }
    
    ///A function that gets the index of the character by using the tapping point
    /// - Parameters:
    ///     - point: Is the tapping point of user
    private func indexOfChar(point: CGPoint) -> Int {
        let textStorage = NSTextStorage(attributedString: self.attributedText!)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: self.frame.size)
        textContainer.lineFragmentPadding = 0
        textContainer.lineBreakMode = self.lineBreakMode
        textContainer.maximumNumberOfLines = self.numberOfLines
        layoutManager.addTextContainer(textContainer)
        
        let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return index
    }
}


