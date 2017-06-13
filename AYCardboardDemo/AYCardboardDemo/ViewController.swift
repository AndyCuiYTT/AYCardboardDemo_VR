//
//  ViewController.swift
//  AYCardboardDemo
//
//  Created by Andy on 2017/6/12.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,GVRWidgetViewDelegate{

    
    let videoView: GVRVideoView = GVRVideoView.init()

    override func viewDidLoad() {
        super.viewDidLoad()
//        var videoView: GCSVideoView = GCSVideoView.init(frame: CGRect.init(x: 10, y: 50, width: self.view.frame.width - 20, height: 200))
//        videoView.delete(self)
//        self.view.addSubview(videoView)
    
        let panoramaView: GVRPanoramaView = GVRPanoramaView.init()
        panoramaView.enableCardboardButton = true
        panoramaView.enableCardboardButton = true
        panoramaView.load(UIImage.init(named: "andes.jpg"), of: GVRPanoramaImageType.mono)
        panoramaView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(panoramaView)
        
        videoView.load(from: URL.init(string: "http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"))
        


        
//        let url: URL = URL.init(fileURLWithPath: Bundle.main.path(forResource: "demo.m4v", ofType: nil)!)
        
        
        
//        videoView.load(from: url)
        videoView.delegate = self
        videoView.enableCardboardButton = true
        videoView.enableFullscreenButton = true
        videoView.translatesAutoresizingMaskIntoConstraints = false
        videoView.backgroundColor = UIColor.orange
        self.view.addSubview(videoView)
        
        
        
        let hConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: .directionLeadingToTrailing, metrics: nil, views: ["view":panoramaView]);
        let vConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[view(200)]-20-[view1(==view)]", options: .directionLeadingToTrailing, metrics: nil, views: ["view":panoramaView,"view1":videoView])
        let hConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: .directionLeadingToTrailing, metrics: nil, views: ["view":videoView]);
        
        self.view.addConstraints(hConstraint)
        self.view.addConstraints(vConstraint)
        self.view.addConstraints(hConstraint1)
    
    }
    
    
    func widgetView(_ widgetView: GVRWidgetView!, didLoadContent content: Any!) {
        videoView.play()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

