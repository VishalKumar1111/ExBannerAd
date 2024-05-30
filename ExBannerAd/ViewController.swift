//
//  ViewController.swift
//  ExBannerAd
//
//  Created by RLogixxTraining on 30/04/24.
//

import UIKit
import GoogleMobileAds
class ViewController: UIViewController,GADBannerViewDelegate {

    var bannerView: GADBannerView!

     override func viewDidLoad() {
       super.viewDidLoad()
         //  Set the ad unit ID and view controller that contains the GADBannerView.
         bannerView = GADBannerView(adSize: GADAdSizeBanner)

               // Set the ad unit ID. Use the test ID for testing purposes.
               bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716" // This is a test ad unit ID.

               // Set the root view controller
               bannerView.rootViewController = self

               // Add the banner view to the view hierarchy
               view.addSubview(bannerView)

               // Set the banner view's constraints
               bannerView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                   bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
               ])

               // Load an ad
               bannerView.load(GADRequest())
           }
       
     

     func addBannerViewToView(_ bannerView: GADBannerView) {
       bannerView.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(bannerView)
       view.addConstraints(
         [NSLayoutConstraint(item: bannerView,
                             attribute: .bottom,
                             relatedBy: .equal,
                             toItem: view.safeAreaLayoutGuide,
                             attribute: .bottom,
                             multiplier: 1,
                             constant: 0),
          NSLayoutConstraint(item: bannerView,
                             attribute: .centerX,
                             relatedBy: .equal,
                             toItem: view,
                             attribute: .centerX,
                             multiplier: 1,
                             constant: 0)
         ])
      }
      
   
       // MARK: - GADBannerViewDelegate

    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("bannerViewDidReceiveAd")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillDIsmissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewDidDismissScreen")
    }
   }
