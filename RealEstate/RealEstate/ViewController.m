//
//  ViewController.m
//  RealEstate
//
//  Created by Dalton on 9/30/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *bedsTextField;
@property (weak, nonatomic) IBOutlet UITextField *bathsTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    geocoder = [[CLGeocoder alloc] init];

    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
        
    }
    
    CLAuthorizationStatus authorizationStatus= [CLLocationManager authorizationStatus];
    
    if (authorizationStatus == kCLAuthorizationStatusAuthorizedAlways ||
        authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
        
        [locationManager startUpdatingLocation];
        
    }
    
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *loc = locationManager.location;
    
    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
//            self.pickupLocationTextField.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@",
//                                                 placemark.subThoroughfare, placemark.thoroughfare,
//                                                 placemark.locality, placemark.administrativeArea,
//                                                 placemark.postalCode];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    }];

}


@end
