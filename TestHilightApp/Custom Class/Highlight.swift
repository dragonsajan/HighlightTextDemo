//
//  Highlight.swift
//  TestHilightApp
//
//  Created by Sajan Kushwaha on 8/8/20.
//  Copyright © 2020 Sajan Kushwaha. All rights reserved.
//

import UIKit


//MARK: - UILabel Code
extension UILabel {
    
    func highlightAllText(color: UIColor = UIColor.yellow) {
        
        guard let testString = self.text, let font = self.font, let textColor = self.textColor else { return }
                 
        let titleParagraphStyle = NSMutableParagraphStyle()
        titleParagraphStyle.alignment = .center

        let attributedText = NSMutableAttributedString(string: testString,
            attributes: [.font: font,
                         .foregroundColor: textColor,
            .paragraphStyle: titleParagraphStyle])

        for text in self.lines ?? [] {
            let newText = text.trimmingCharacters(in: .whitespacesAndNewlines)
            let ranges = testString.ranges(of: newText)
            for range in ranges {
                let nsrange = NSRange(range, in: testString)
                if nsrange.location != NSNotFound {
                    attributedText.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.red, range: nsrange)
                }
            }
        }
        
        self.attributedText = attributedText
    }
    

    var lines: [String]? {

        guard let text = text, let font = font else { return nil }

        let attStr = NSMutableAttributedString(string: text)
        attStr.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: attStr.length))

        let frameSetter = CTFramesetterCreateWithAttributedString(attStr as CFAttributedString)
        let path = CGMutablePath()

        // size needs to be adjusted, because frame might change because of intelligent word wrapping of iOS
        let size = sizeThatFits(CGSize(width: self.frame.width, height: .greatestFiniteMagnitude))
        path.addRect(CGRect(x: 0, y: 0, width: size.width, height: size.height), transform: .identity)

        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, attStr.length), path, nil)
        guard let lines = CTFrameGetLines(frame) as? [Any] else { return nil }

        var linesArray: [String] = []

        for line in lines {
            let lineRef = line as! CTLine
            let lineRange = CTLineGetStringRange(lineRef)
            let range = NSRange(location: lineRange.location, length: lineRange.length)
            let lineString = (text as NSString).substring(with: range)
            linesArray.append(lineString)
        }
        return linesArray
    }
}



//MARK: - UITextView Code
extension UITextView {
    
    
    func highlightAllText(color: UIColor = UIColor.yellow) {
        
        guard let testString = self.text, let font = self.font, let textColor = self.textColor else { return }
                 
        let titleParagraphStyle = NSMutableParagraphStyle()
        titleParagraphStyle.alignment = self.textAlignment

        let attributedText = NSMutableAttributedString(string: testString,
            attributes: [.font: font,
                         .foregroundColor: textColor,
            .paragraphStyle: titleParagraphStyle])

        for text in self.lines ?? [] {
            let newText = text.trimmingCharacters(in: .whitespacesAndNewlines)
            let ranges = testString.ranges(of: newText)
            for range in ranges {
                let nsrange = NSRange(range, in: testString)
                if nsrange.location != NSNotFound {
                    attributedText.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.red, range: nsrange)
                }
            }
        }
        
        self.attributedText = attributedText
    }
    
    

    
    var lines: [String]? {

        guard let text = text, let font = font else { return nil }

        let attStr = NSMutableAttributedString(string: text)
        attStr.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: attStr.length))

        let frameSetter = CTFramesetterCreateWithAttributedString(attStr as CFAttributedString)
        let path = CGMutablePath()

        // size needs to be adjusted, because frame might change because of intelligent word wrapping of iOS
        let size = sizeThatFits(CGSize(width: self.frame.width, height: .greatestFiniteMagnitude))
        path.addRect(CGRect(x: 0, y: 0, width: size.width, height: size.height), transform: .identity)

        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, attStr.length), path, nil)
        guard let lines = CTFrameGetLines(frame) as? [Any] else { return nil }

        var linesArray: [String] = []

        for line in lines {
            let lineRef = line as! CTLine
            let lineRange = CTLineGetStringRange(lineRef)
            let range = NSRange(location: lineRange.location, length: lineRange.length)
            let lineString = (text as NSString).substring(with: range)
            linesArray.append(lineString)
        }
        return linesArray
    }
}



//MARK: - CATextLayer Code
extension CATextLayer {
    
    func highlightAllText(color: UIColor = UIColor.yellow) {
        
        var tempTestString : String?
        if let temp = self.string as? String {
            tempTestString = temp
        } else if let temp = self.string as? NSAttributedString {
            tempTestString = temp.string
        }
        
        guard let testString = tempTestString, let font = self.font, let textColor = self.foregroundColor else { return }
                 
        self.alignmentMode = CATextLayerAlignmentMode.center

        let attributedText = NSMutableAttributedString(string: testString,
            attributes: [.font: font,
                         .foregroundColor: textColor])

        for text in self.lines ?? [] {
            let newText = text.trimmingCharacters(in: .whitespacesAndNewlines)
            let ranges = testString.ranges(of: newText)
            for range in ranges {
                let nsrange = NSRange(range, in: testString)
                if nsrange.location != NSNotFound {
                    attributedText.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.red, range: nsrange)
                }
            }
        }
        
        self.string = attributedText
    }
    

    /// creates an array containing one entry for each line of text the label has
    var lines: [String]? {
        
        var tempTestString : String?
        if let temp = self.string as? String {
            tempTestString = temp
        } else if let temp = self.string as? NSAttributedString {
            tempTestString = temp.string
        }
        if tempTestString?.count ?? 0 > 0 {
            tempTestString = "\(tempTestString ?? "")\n"
        }

        guard let text = tempTestString, let font = font else { return nil }

        let attStr = NSMutableAttributedString(string: text)
        attStr.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: attStr.length))

        let frameSetter = CTFramesetterCreateWithAttributedString(attStr as CFAttributedString)
        let path = CGMutablePath()

        // size needs to be adjusted, because frame might change because of intelligent word wrapping of iOS
        let size = text.size(OfFont: font as! UIFont)  //sizeThatFits(CGSize(width: self.frame.width, height: .greatestFiniteMagnitude))
        path.addRect(CGRect(x: 0, y: 0, width: size.width, height: size.height), transform: .identity)

        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, attStr.length), path, nil)
        guard let lines = CTFrameGetLines(frame) as? [Any] else { return nil }

        var linesArray: [String] = []

        for line in lines {
            let lineRef = line as! CTLine
            let lineRange = CTLineGetStringRange(lineRef)
            let range = NSRange(location: lineRange.location, length: lineRange.length)
            let lineString = (text as NSString).substring(with: range)
            linesArray.append(lineString)
        }
        return linesArray
    }
}



//MARK: - Helper Codes

extension String {
    
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    func indices(of occurrence: String) -> [Int] {
        var indices = [Int]()
        var position = startIndex
        while let range = range(of: occurrence, range: position..<endIndex) {
            let i = distance(from: startIndex,
                             to: range.lowerBound)
            indices.append(i)
            let offset = occurrence.distance(from: occurrence.startIndex,
                                             to: occurrence.endIndex) - 1
            guard let after = index(range.lowerBound,
                                    offsetBy: offset,
                                    limitedBy: endIndex) else {
                                        break
            }
            position = index(after: after)
        }
        return indices
    }
    
    func ranges(of searchString: String) -> [Range<String.Index>] {
        let _indices = indices(of: searchString)
        let count = searchString.count
        return _indices.map({ index(startIndex, offsetBy: $0)..<index(startIndex, offsetBy: $0+count) })
    }
    
    func size(OfFont font: UIFont) -> CGSize {
           return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
       }
}

