//
//  DashboardViewController.h
//  ProjectElephant
//
//  Created by Kris Jones on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import <EstimoteSDK/EstimoteSDK.h>
#import "AFNetworking.h"
#import "Constants.h"
typedef enum : int
{
    ESTScanTypeBluetooth,
    ESTScanTypeBeacon
    
} ESTScanType;


@interface DashboardViewController : UIViewController
- (id)initWithScanType:(ESTScanType)scanType completion:(void (^)(id))completion;

@end
