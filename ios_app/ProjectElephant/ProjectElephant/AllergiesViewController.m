//
//  AllergiesViewController.m
//  ProjectElephant
//
//  Created by Ryan Beckett on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import "AllergiesViewController.h"

@implementation AllergiesViewController


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
    self.allergiesTable.dataSource = self;
    self.allergiesTable.delegate = self;
    // Do any additional setup after loading the view.
    
    self.alergiesList = [self.PatientInfo objectForKey:@"patientAlergies"];
    
    self.allergiesTable.dataSource = self;
    self.allergiesTable.delegate = self;
    [self.allergiesTable reloadData];
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
    return [self.alergiesList count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllCEll" forIndexPath:indexPath];
    
    
    NSDictionary *patient = [self.alergiesList objectAtIndexedSubscript:indexPath.row];
    NSDictionary *al  = [patient objectForKey:@"alergy"];
    NSString* name = [al objectForKey:@"name"];
    NSString* desc = [al objectForKey:@"description"];
    cell.textLabel.text =name;
    cell.detailTextLabel.text =desc;
    return cell;
}


@end
