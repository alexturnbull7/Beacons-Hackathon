//
//  DashboardViewController.m
//  ProjectElephant
//
//  Created by Kris Jones on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import "DashboardViewController.h"
#import "PatientInformationViewController.h"

@interface DashboardViewController ()<ESTBeaconManagerDelegate, ESTUtilityManagerDelegate>

@property (nonatomic, copy)     void (^completion)(CLBeacon *);
@property (nonatomic, assign)   ESTScanType scanType;

@property (nonatomic, strong) ESTBeaconManager *beaconManager;
@property (nonatomic, strong) ESTUtilityManager *utilityManager;
@property (nonatomic, strong) NSArray *beaconsArray;
@property (nonatomic, strong) CLBeaconRegion *region;
@property (nonatomic, strong) NSString *isBeacon;

@end

@implementation DashboardViewController

- (id)initWithScanType:(ESTScanType)scanType completion:(void (^)(id))completion
{
    self = [super init];
    if (self)
    {
        self.scanType = scanType;
        self.completion = [completion copy];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"username"]== nil  || [[defaults objectForKey:@"username"] isEqualToString:@""]){
        
        NSString * storyboardName = @"login";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        LoginViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"Login"];
        //        [self.navigationController presentViewController:vc animated:YES completion:nil];
        
        
        [self presentViewController:vc animated:YES completion:nil];
        
        
    }
    
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    self.isBeacon = @"";
    
    self.beaconManager = [[ESTBeaconManager alloc] init];
    self.beaconManager.delegate = self;
    
    self.utilityManager = [[ESTUtilityManager alloc] init];
    self.utilityManager.delegate = self;
    
    self.region = [[CLBeaconRegion alloc] initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID
                                                     identifier:@"EstimoteSampleRegion"];
    
    if (self.scanType == ESTScanTypeBeacon)
    {
        [self startRangingBeacons];
    }
    else
    {
        [self.utilityManager startEstimoteBeaconDiscovery];
    }
    

}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    /*
     *Stops ranging after exiting the view.
     */
    [self.beaconManager stopRangingBeaconsInRegion:self.region];
    [self.utilityManager stopEstimoteBeaconDiscovery];
}



-(void)startRangingBeacons
{
    if ([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
    {
        [self.beaconManager requestAlwaysAuthorization];
        [self.beaconManager startRangingBeaconsInRegion:self.region];
    }
    else if([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusAuthorized)
    {
        [self.beaconManager startRangingBeaconsInRegion:self.region];
    }
    else if([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Access Denied"
                                                        message:@"You have denied access to location services. Change this in app settings."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        
        [alert show];
    }
    else if([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusRestricted)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Not Available"
                                                        message:@"You have no access to location services."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        
        [alert show];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ESTBeaconManager delegate

- (void)beaconManager:(id)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    UIAlertView* errorView = [[UIAlertView alloc] initWithTitle:@"Ranging error"
                                                        message:error.localizedDescription
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    
    [errorView show];
}

- (void)beaconManager:(id)manager monitoringDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    UIAlertView* errorView = [[UIAlertView alloc] initWithTitle:@"Monitoring error"
                                                        message:error.localizedDescription
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    
    [errorView show];
}

- (void)beaconManager:(id)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    self.beaconsArray = beacons;
    
    //  [self.tableView reloadData];
}

- (void)utilityManager:(ESTUtilityManager *)manager didDiscoverBeacons:(NSArray *)beacons
{
    self.beaconsArray = beacons;
    if([self.beaconsArray count]>0){
        id beac = [beacons objectAtIndex:0];
        
        if ([beac isKindOfClass:[CLBeacon class]])
        {
            CLBeacon *cBeacon = (CLBeacon *)beac;
            
            if(cBeacon.proximity == CLProximityImmediate){
                
                NSLog(@"%@",[NSString stringWithFormat:@"Major: %@, Minor: %@", cBeacon.major, cBeacon.minor]);
                
                NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@patient/%@/%@",WEBSERVICE, cBeacon.major, cBeacon.minor]];
                NSURLRequest *request = [NSURLRequest requestWithURL:URL];
                AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
                op.responseSerializer = [AFJSONResponseSerializer serializer];
                [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSLog(@"JSON: %@", responseObject);
                    
                    
                    NSString * storyboardName = @"Main";
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
                    PatientInformationViewController* patientInfo = [storyboard instantiateViewControllerWithIdentifier:@"patInfo"];
                    patientInfo.PatientInfo = responseObject;
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.region];
                    [self.utilityManager stopEstimoteBeaconDiscovery];
                    [self.navigationController pushViewController:patientInfo animated:YES];
                    
                    
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"Error: %@", error);
                }];
                [[NSOperationQueue mainQueue] addOperation:op];
                
            }
            
        }
        else if([beac isKindOfClass:[ESTBluetoothBeacon class]])
        {
          ESTBluetoothBeacon *cBeacon = (ESTBluetoothBeacon *)beac;
 
           
                
                NSLog(@"%@",[NSString stringWithFormat:@"Major: %@, Minor: %@", cBeacon.major, cBeacon.minor]);
                
                NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@patient/%@/%@",WEBSERVICE, cBeacon.major, cBeacon.minor]];
                NSURLRequest *request = [NSURLRequest requestWithURL:URL];
                AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
                op.responseSerializer = [AFJSONResponseSerializer serializer];
                [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSLog(@"JSON: %@", responseObject);
                    
                    
                    NSString * storyboardName = @"Main";
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
                    PatientInformationViewController* patientInfo = [storyboard instantiateViewControllerWithIdentifier:@"patInfo"];
                    patientInfo.PatientInfo = responseObject;
                    
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.region];
                    [self.utilityManager stopEstimoteBeaconDiscovery];
                    
                    if(![self.isBeacon isEqualToString:@"pushed"]){
                    [self.navigationController pushViewController:patientInfo animated:YES];
                    self.isBeacon = @"pushed";
                    }
                    
                    
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"Error: %@", error);
                }];
                [[NSOperationQueue mainQueue] addOperation:op];
            
            
            
        }
        
    }
    
    
    // [self.tableView reloadData];
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
