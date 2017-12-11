//
//  MedicationViewController.h
//  ProjectElephant
//
//  Created by Ryan Beckett on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "MedTableViewCell.h"

@interface MedicationViewController : UITableViewController

@property (strong, nonatomic) NSDictionary *PatientInfo;
@property (strong, nonatomic) NSArray *medicationList;
@end
