//
//  OverviewViewController.m
//  ProjectElephant
//
//  Created by Ryan Beckett on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import "OverviewViewController.h"

@implementation OverviewViewController

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

    
    [self updateui];
    
    
    
}

-(void)updateui{
    
    self.patientname.text = [self.PatientInfo valueForKey:@"name"];
    self.gender.text = [self.PatientInfo valueForKey:@"gender"];
    
    double unixTimeStamp = [[self.PatientInfo objectForKey:@"dob"] doubleValue];
    NSTimeInterval _interval=unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [formatter stringFromDate:date];
    
    
    self.deb.text = dateString;
    
    
    double date1 = [[self.PatientInfo objectForKey:@"dob"] doubleValue];
    NSTimeInterval _interval1=date1;
    NSDate *date12 = [NSDate dateWithTimeIntervalSince1970:_interval1];
    NSDateFormatter *formatter1= [[NSDateFormatter alloc] init];
    [formatter1 setLocale:[NSLocale currentLocale]];
    [formatter1 setDateFormat:@"dd/MM"];
    NSString *dateString1 = [formatter1 stringFromDate:date12];
    self.dischargeDate.text = dateString1;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Do any additional setup after loading the view.
    self.allergies = [self.PatientInfo objectForKey:@"patientAlergies"];
    self.notes = [self.PatientInfo  objectForKey:@"notes"];
    self.outstadingActions = [self.PatientInfo  objectForKey:@"patientTests"];
    
    self.allergiesTable.dataSource = self;
    self.allergiesTable.delegate = self;
    
    self.PatientNotes.dataSource = self;
    self.PatientNotes.delegate = self;
    
    self.OutstandingPatientAction.dataSource = self;
    self.OutstandingPatientAction.delegate = self;
    
    [self.OutstandingPatientAction reloadData];
    [self.PatientNotes reloadData];
    [self.allergiesTable reloadData];
    

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(tableView == self.allergiesTable){
        return [self.allergies count];
    }else if (tableView == self.OutstandingPatientAction)
    {
        return [self.outstadingActions count];
        
    }else if (tableView == self.PatientNotes){
        
        return [self.notes count];
    }
    return 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    if(tableView ==self.allergiesTable){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Allergies" forIndexPath:indexPath];
        NSDictionary *aller =[[self.allergies objectAtIndex:indexPath.row]objectForKey:@"alergy"];
        cell.textLabel.text = [aller objectForKey:@"name"];
        cell.detailTextLabel.text = [aller objectForKey:@"description"];
        
        return cell;
    }
    
    if(tableView ==self.OutstandingPatientAction){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Out" forIndexPath:indexPath];
        NSDictionary *aller =[self.outstadingActions objectAtIndex:indexPath.row];
        cell.textLabel.text = [aller objectForKey:@"type"];
        cell.detailTextLabel.text = [aller objectForKey:@"description"];
        
        return cell;
    }
    
    if(tableView ==self.PatientNotes){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Notes" forIndexPath:indexPath];
        NSDictionary *aller =[self.notes objectAtIndex:indexPath.row];
        cell.textLabel.text = [aller objectForKey:@"note"];
        cell.detailTextLabel.text=@"";
        return cell;
    }
    
    
    // MedicationCell
    
    
    
    return cell;
}



@end
