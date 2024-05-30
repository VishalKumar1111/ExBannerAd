//
//  ViewController.swift
//  ExBannerAd
//
//  Created by RLogixxTraining on 30/04/24.
//

import UIKit
import GoogleMobileAds
class ViewController: UIViewController,GADBannerViewDelegate,GADFullScreenContentDelegate {
    
    
    //*************************************Banner ADs*************************************************
    
    
    
    //    var bannerView: GADBannerView!
    
    //     override func viewDidLoad() {
    //       super.viewDidLoad()
    //         //  Set the ad unit ID and view controller that contains the GADBannerView.
    //         bannerView = GADBannerView(adSize: GADAdSizeBanner)
    //
    //               // Set the ad unit ID. Use the test ID for testing purposes.
    //               bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716" // This is a test ad unit ID.
    //
    //               // Set the root view controller
    //               bannerView.rootViewController = self
    //
    //               // Add the banner view to the view hierarchy
    //               view.addSubview(bannerView)
    //
    //               // Set the banner view's constraints
    //               bannerView.translatesAutoresizingMaskIntoConstraints = false
    //               NSLayoutConstraint.activate([
    //                   bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    //                   bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    //               ])
    //
    //               // Load an ad
    //               bannerView.load(GADRequest())
    //           }
    //
    //
    //
    //     func addBannerViewToView(_ bannerView: GADBannerView) {
    //       bannerView.translatesAutoresizingMaskIntoConstraints = false
    //       view.addSubview(bannerView)
    //       view.addConstraints(
    //         [NSLayoutConstraint(item: bannerView,
    //                             attribute: .bottom,
    //                             relatedBy: .equal,
    //                             toItem: view.safeAreaLayoutGuide,
    //                             attribute: .bottom,
    //                             multiplier: 1,
    //                             constant: 0),
    //          NSLayoutConstraint(item: bannerView,
    //                             attribute: .centerX,
    //                             relatedBy: .equal,
    //                             toItem: view,
    //                             attribute: .centerX,
    //                             multiplier: 1,
    //                             constant: 0)
    //         ])
    //      }
    //
    //
    //
    //
    //    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
    //      print("bannerViewDidReceiveAd")
    //    }
    //
    //    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
    //      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    //    }
    //
    //    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
    //      print("bannerViewDidRecordImpression")
    //    }
    //
    //    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
    //      print("bannerViewWillPresentScreen")
    //    }
    //
    //    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
    //      print("bannerViewWillDIsmissScreen")
    //    }
    //
    //    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
    //      print("bannerViewDidDismissScreen")
    //    }
    //   }
    
    
    
    
    //******************************************GADInterstitialAd**************************************
    
    //       private var interstitial: GADInterstitialAd?
    //
    //       override func viewDidLoad() {
    //           super.viewDidLoad()
    //
    //           // Load Interstitial Ad
    //           loadInterstitialAd()
    //       }
    //
    //
    //    @IBAction func btnInteristitial(_ sender: Any) {
    //
    //        guard let interstitial = interstitial else {
    //           return print("Ad wasn't ready.")
    //         }
    //
    //         // The UIViewController parameter is an optional.
    //         interstitial.present(fromRootViewController: nil)
    //
    //    }
    //
    //
    //      func loadInterstitialAd() {
    //          GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910", request: GADRequest()) { [self] ad, error in
    //              if let error = error {
    //                  print("Failed to load interstitial ad with error: \(error.localizedDescription)")
    //                  return
    //              }
    //              interstitial = ad
    //              interstitial?.fullScreenContentDelegate = self
    //          }
    //      }
    //
    //
    //
    //      // MARK: - GADFullScreenContentDelegate
    //
    //      func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
    //          print("Ad did fail to present full screen content.")
    //      }
    //
    //      func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
    //          print("Ad will present full screen content.")
    //      }
    //
    //      func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
    //          print("Ad did dismiss full screen content.")
    //      }
    //
    //
    //
    //
    //
    //
    //  }
    
    
//***************************** REWARD AD ************************************************************
    private var rewardedAd: GADRewardedAd?

    func loadRewardedAd() async {
        do {
          rewardedAd = try await GADRewardedAd.load(
            withAdUnitID: "ca-app-pub-3940256099942544/1712485313", request: GADRequest())
          rewardedAd?.fullScreenContentDelegate = self
        } catch {
          print("Rewarded ad failed to load with error: \(error.localizedDescription)")
        }
      }
    
    func present(fromRootViewController rootViewController: UIViewController?, userDidEarnRewardHandler: @escaping GADUserDidEarnRewardHandler){
        print("Ad did fail to present full screen content with error: ")
    }

      /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        
        print("Ad did fail to present full screen content with error: \(error.localizedDescription)")
        
       }


      /// Tells the delegate that the ad will present full screen content.
      func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
      }

      /// Tells the delegate that the ad dismissed full screen content.
      func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
      }
    
    @IBAction func btnReward(_ sender: Any) {
        Task { @MainActor in
               if rewardedAd == nil {
                   await loadRewardedAd()
                   return
               }

               if let rewardedAd = rewardedAd {
                   rewardedAd.present(fromRootViewController: self) {
                       let reward = rewardedAd.adReward
                       print("Reward received with currency: \(reward.type), amount: \(reward.amount)")
                       
                   }
               } else {
                   print("Ad wasn't ready or failed to load")
               }
           }
    }
    
        
}
    
    

   
