//
//  RatingControl.swift
//  Minga
//
//  Created by Carmen Probst on 05.06.17.
//  Copyright © 2017 MingaApp. All rights reserved.
//

import UIKit

protocol StarRatingControlDelegate: class {
    func didSelectRating(_ control: StarRatingControl, rating: Int)
}


class StarRatingControl: UIView {

    @IBInspectable
    var rating: Int = 0 {
        didSet {
            guard rating > 0 else {
                rating = 0
                return
            }
            guard rating <= maxRating else {
                rating = maxRating
                return
            }
            setNeedsLayout()
        }
    }

    @IBInspectable
    var maxRating: Int = 5 {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable
    var filledStarImage : UIImage? {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable
    var emptyStarImage : UIImage? {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable
    var spacing : Int = 5 {
        didSet {
            setNeedsDisplay()
        }
    }

    weak var delegate: StarRatingControlDelegate?

    fileprivate var ratingButtons = [UIButton]()
    fileprivate var buttonSize : Int {
        return Int(self.frame.height)
    }
    fileprivate var width : Int {
        return (buttonSize + spacing) * maxRating
    }

    func initRate() {
        if ratingButtons.count == 0 {

            for _ in 0..<maxRating {
                let button = UIButton()

                button.setImage(emptyStarImage, for: UIControlState())
                button.setImage(filledStarImage, for: .selected)
                button.setImage(filledStarImage, for: [.highlighted, .selected])
                button.isUserInteractionEnabled = false

                button.adjustsImageWhenHighlighted = false
                ratingButtons += [button]
                addSubview(button)
            }
        }
    }

    override open func layoutSubviews() {
        super.layoutSubviews()

        self.initRate()
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)

        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }

    override open var intrinsicContentSize : CGSize {
        return CGSize(width: width, height: buttonSize)
    }

    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleStarTouches(touches, withEvent: event)
    }

    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleStarTouches(touches, withEvent: event)
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.didSelectRating(self, rating: self.rating)
    }

    func handleStarTouches(_ touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)

            if position.x > -50 && position.x < CGFloat(width + 50) {
                ratingButtonSelected(position)
            }
        }
    }

    func ratingButtonSelected(_ position: CGPoint) {
        for (index, button) in ratingButtons.enumerated() {
            if position.x > button.frame.minX {
                self.rating = index + 1
            } else if position.x < 0 {
                self.rating = 0
            }
        }
    }

}
