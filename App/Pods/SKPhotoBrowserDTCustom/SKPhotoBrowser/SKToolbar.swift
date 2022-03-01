//
//  SKToolbar.swift
//  SKPhotoBrowser
//
//  Created by keishi_suzuki on 2017/12/20.
//  Copyright © 2017年 suzuki_keishi. All rights reserved.
//

import Foundation

// helpers which often used
private let bundle = Bundle(for: SKPhotoBrowser.self)

class SKToolbar: UIToolbar {
    var toolActionButton: UIBarButtonItem!
    var downloadActionButton: UIBarButtonItem!
    var customActionButton: UIBarButtonItem!
    fileprivate weak var browser: SKPhotoBrowser?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, browser: SKPhotoBrowser) {
        self.init(frame: frame)
        self.browser = browser
        
        setupApperance()
        setupToolbar()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let view = super.hitTest(point, with: event) {
            if SKMesurement.screenWidth - point.x < SKPhotoBrowserOptions.toolbarTouchMaxValue { // FIXME: not good idea
                return view
            }
        }
        return nil
    }
}

private extension SKToolbar {
    func setupApperance() {
        backgroundColor = .clear
        clipsToBounds = true
        isTranslucent = true
        setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
    }
    
    func setupToolbar() {
        toolActionButton = UIBarButtonItem(barButtonSystemItem: .action, target: browser, action: #selector(SKPhotoBrowser.actionButtonPressed))
        toolActionButton.tintColor = UIColor.white
        
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        if SKPhotoBrowserOptions.displayAction {
            items.append(toolActionButton)
        }
        
        if SKPhotoBrowserOptions.displayDownloadAction {
            downloadActionButton = UIBarButtonItem(image: SKPhotoBrowserOptions.displayDownloadImage, style: .plain, target: browser, action: #selector(SKPhotoBrowser.actionDownloadButtonPressed))
            downloadActionButton.tintColor = UIColor.white
            items.append(downloadActionButton)
        }

        if SKPhotoBrowserOptions.displayCustomAction {
            customActionButton = UIBarButtonItem(image: SKPhotoBrowserOptions.displayCustomImage, style: .plain, target: browser, action: #selector(SKPhotoBrowser.actionCustomButtonPressed))
            customActionButton.tintColor = UIColor.white
            items.append(customActionButton)
        }
        setItems(items, animated: false)
    }
    
    func setupActionButton() {
    }
}

