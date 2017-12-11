//
//  MedTableViewCell.h
//  ProjectElephant
//
//  Created by Kris Jones on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *medName;
@property (strong, nonatomic) IBOutlet UILabel *MedDesc;
@property (strong, nonatomic) IBOutlet UILabel *DateForMeds;
@property (strong, nonatomic) IBOutlet UILabel *Doesage;

@end
