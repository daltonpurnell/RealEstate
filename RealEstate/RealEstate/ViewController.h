//
//  ViewController.h
//  RealEstate
//
//  Created by Dalton on 9/30/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;
@import MapKit;


@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    
    CLLocationManager *locationManager;
    CLPlacemark *placemark;
    CLGeocoder *geocoder;

}



@end

