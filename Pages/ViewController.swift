//
//  ViewController.swift
//  Pages
//
//  Created by Henry Aguinaga on 2016-12-01.
//  Copyright © 2016 Henry Aguinaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pageControlOutlet: UIPageControl!
    @IBOutlet weak var lblCurrentIndexOUTLET: UILabel!
    @IBOutlet weak var btnShowHideOUTLET: UIButton!
    
    @IBOutlet weak var imageViewOUTLET: UIImageView!
    
    let SPACE : CGFloat = 8
    var NORMAL_FRAME, EXPANDED_FRAME : CGRect?
    
    
    let arrayOfImages : [UIImage] = [#imageLiteral(resourceName: "goose"), #imageLiteral(resourceName: "lejon"), #imageLiteral(resourceName: "eagle"), #imageLiteral(resourceName: "loro"), #imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "zebra")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let newHeight : CGFloat = imageViewOUTLET.frame.height + SPACE + btnShowHideOUTLET.frame.height
        NORMAL_FRAME = imageViewOUTLET.frame
        EXPANDED_FRAME = CGRect(x: imageViewOUTLET.frame.origin.x, y: imageViewOUTLET.frame.origin.y, width: imageViewOUTLET.frame.width, height: newHeight)
    }
    
    func changeImageDisplayedRandomly() {
        let randomIndex = Int(arc4random_uniform(UInt32(arrayOfImages.count)))
        
        let randomIndexFromArray = arrayOfImages[randomIndex]
        
        let currentIndex = pageControlOutlet.currentPage
        
        if currentIndex % 2 == 0 {
             imageViewOUTLET.frame = NORMAL_FRAME!
        } else {
            imageViewOUTLET.frame = EXPANDED_FRAME!
        }
        
        imageViewOUTLET.image = randomIndexFromArray
        
        
        
        
        
    }
    
    func changeImageDisplayed() {
        let currentIndex = pageControlOutlet.currentPage
        
        switch currentIndex {
        case 0:
            imageViewOUTLET.image = #imageLiteral(resourceName: "goose")
        case 1:
            imageViewOUTLET.image = #imageLiteral(resourceName: "lejon")
        case 2:
            imageViewOUTLET.image = #imageLiteral(resourceName: "loro")
        case 3:
            imageViewOUTLET.image = #imageLiteral(resourceName: "eagle")
        case 4:
            imageViewOUTLET.image = #imageLiteral(resourceName: "dog")
        case 5:
            imageViewOUTLET.image = #imageLiteral(resourceName: "zebra")
        default:
            break
        }
    }
    
    func changeLabelAndButtonProperties() {
        let currentIndex = pageControlOutlet.currentPage
        lblCurrentIndexOUTLET.text = "Current Index: \(currentIndex)"
        
        if currentIndex % 2 == 0 {
            btnShowHideOUTLET.isHidden = false
        } else {
            btnShowHideOUTLET.isHidden = true
        }
        
    }
    
    @IBAction func twoFingersTapChangedBackgroundColorACTION(_ sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            animateWithSpring {
                let randomWhiteComponent = CGFloat(arc4random_uniform(256)) / 255
                
                let randomShadeOfGray = UIColor.init(white: randomWhiteComponent, alpha: 1)
                self.pageControlOutlet.backgroundColor = randomShadeOfGray

            }
   
        }
    }
    
    func animateWithSpring(codeThatGetsAnimated: @escaping () -> Void) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveLinear, animations: codeThatGetsAnimated, completion: nil)
    }
    
    @IBAction func currentPageChangedACTION(_ sender: UIPageControl) {
        
        imageViewOUTLET.frame = CGRect(origin: imageViewOUTLET.center, size: CGSize.zero)
        
        animateWithSpring {
            self.applyRandomColorForPageIndecator()
            self.changeLabelAndButtonProperties()
            self.changeImageDisplayedRandomly()
            
            self.imageViewOUTLET.frame = (self.pageControlOutlet.currentPage % 2 == 0 ? self.NORMAL_FRAME : self.EXPANDED_FRAME)!
        }
        
        
        //applySpecificcolorForPageIndicator()
        //applyRandomColorForPageIndecator()
    }
    
    @IBAction func previousACTION(_ sender: UIButton) {
        
        imageViewOUTLET.frame.origin.x = imageViewOUTLET.frame.width
        
        
        animateWithSpring {
            self.applyRandomColorForPageIndecator()
            self.changeLabelAndButtonProperties()
            self.changeImageDisplayedRandomly()
            self.imageViewOUTLET.frame.origin.x = (self.NORMAL_FRAME?.origin.x)!
            
        }
        
        pageControlOutlet.currentPage -= 1
        //applySpecificcolorForPageIndicator()
        //applyRandomColorForPageIndecator()
    }
    @IBAction func nextACTION(_ sender: UIButton) {
        
        imageViewOUTLET.frame.origin.x = -imageViewOUTLET.frame.width
        
        animateWithSpring {
            self.applyRandomColorForPageIndecator()
            self.changeLabelAndButtonProperties()
            self.changeImageDisplayedRandomly()
            self.imageViewOUTLET.frame.origin.x = (self.NORMAL_FRAME?.origin.x)!

        }
        
        
        
        
        pageControlOutlet.currentPage += 1
        //applySpecificcolorForPageIndicator()
        //applyRandomColorForPageIndecator()
    }
    
    func applySpecificcolorForPageIndicator() {
        
        let currentPageIndex = pageControlOutlet.currentPage
        
        switch currentPageIndex {
        case 0:
            pageControlOutlet.currentPageIndicatorTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case 1:
            pageControlOutlet.currentPageIndicatorTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        case 2:
            pageControlOutlet.currentPageIndicatorTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case 3:
            pageControlOutlet.currentPageIndicatorTintColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        default:
            pageControlOutlet.currentPageIndicatorTintColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
        
    }
    
    func applyRandomColorForPageIndecator() {
        let randomRed = CGFloat(arc4random_uniform(256)) / 255
        let randomGreen = CGFloat(arc4random_uniform(256)) / 255
        let randomBlue = CGFloat(arc4random_uniform(256)) / 255
        
        let randomcolor = UIColor.init(displayP3Red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1)
        
        pageControlOutlet.currentPageIndicatorTintColor = randomcolor
    }

}






















