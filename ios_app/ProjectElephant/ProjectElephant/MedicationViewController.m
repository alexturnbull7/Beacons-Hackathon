//
//  MedicationViewController.m
//  ProjectElephant
//
//  Created by Ryan Beckett on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import "MedicationViewController.h"


@implementation MedicationViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.medicationList = [self.PatientInfo objectForKey:@"patientMedication"];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [self.medicationList count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    MedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MedicationCell" forIndexPath:indexPath];
    
    
    NSDictionary *medication = [self.medicationList objectAtIndexedSubscript:indexPath.row];
    NSDictionary *meds = [medication objectForKey:@"medication"];
    //
    cell.medName = [meds objectForKey:@"name"];
    
    cell.MedDesc.text = [meds objectForKey:@"description"];
    
    cell.Doesage.text = [medication objectForKey:@"dosage"];
    
    double unixTimeStamp = [[medication objectForKey:@"timetotake"] doubleValue];
    NSTimeInterval _interval=unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"dd/MM"];
    NSString *dateString = [formatter stringFromDate:date];
    
    cell.DateForMeds.text = dateString;
    
    
    return cell;
}




@end
