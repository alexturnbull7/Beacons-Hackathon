//
//  FirstViewController.h
//  ProjectElephant
//
//  Created by Kris Jones on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatientSearchTableViewController.h"
#import "GUITabPagerViewController.h"


@interface PatientInformationViewController : GUITabPagerViewController <UISearchBarDelegate,GUITabPagerDataSource, GUITabPagerDelegate>

@property (strong, nonatomic) NSDictionary *PatientInfo;


@end

