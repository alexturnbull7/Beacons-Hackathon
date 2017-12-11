//
//  PatientSearchTableViewController.h
//  ProjectElephant
//
//  Created by Kris Jones on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "Constants.h"

@interface PatientSearchTableViewController : UITableViewController<UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *SearchBar;
@property (strong, nonatomic) NSArray *Patients;
@property (strong, nonatomic) NSDictionary *selectedPatient;

@end
