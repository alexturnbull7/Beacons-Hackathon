//
//  OverviewViewController.h
//  ProjectElephant
//
//  Created by Ryan Beckett on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "Constants.h"

@interface OverviewViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *OutstandingPatientAction;
@property (strong, nonatomic) IBOutlet UITableView *PatientNotes;
@property (strong, nonatomic) IBOutlet UILabel *gender;
@property (strong, nonatomic) IBOutlet UILabel *deb;

@property (strong, nonatomic) IBOutlet UILabel *dischargeDate;
@property (strong, nonatomic) IBOutlet UITableView *allergiesTable;
@property (strong, nonatomic) IBOutlet UILabel *patientname;
@property (strong, nonatomic) NSDictionary *PatientInfo;
@property (strong, nonatomic) NSArray *allergies;
@property (strong, nonatomic) NSArray *outstadingActions;
@property (strong, nonatomic) NSArray *notes;
@end
