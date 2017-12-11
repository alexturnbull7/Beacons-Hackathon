//
//  AllergiesViewController.h
//  ProjectElephant
//
//  Created by Ryan Beckett on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllergiesViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *allergiesTable;

@property (strong, nonatomic) NSDictionary *PatientInfo;
@property (strong, nonatomic) NSArray *alergiesList;
@end
