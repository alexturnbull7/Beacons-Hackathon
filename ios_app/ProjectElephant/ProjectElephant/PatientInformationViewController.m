//
//  FirstViewController.m
//  ProjectElephant
//
//  Created by Kris Jones on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import "PatientInformationViewController.h"

#import "OverviewViewController.h"
#import "MedicationViewController.h"
#import "AllergiesViewController.h"
#import "PhysicalExamViewController.h"
#import "TestsViewController.h"
#import "PatientViewController.h"

@implementation PatientInformationViewController{
    
    BOOL _isReload;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDataSource:self];
    [self setDelegate:self];
    [self reloadData];
      // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfViewControllers {
    return 3;
}


- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    if(index ==0){
    NSString * storyboardName = @"Overview";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    OverviewViewController* child_1 = [storyboard instantiateViewControllerWithIdentifier:@"OverviewView"];
    child_1.PatientInfo = self.PatientInfo;
    
        return child_1;}
    else  if(index ==1){
        NSString * storyboardName = @"Medication";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        MedicationViewController* child_1 = [storyboard instantiateViewControllerWithIdentifier:@"MedicationView"];
        child_1.PatientInfo = self.PatientInfo;
        
        return child_1;

    }
    else{
        NSString * storyboardName = @"Allergies";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        MedicationViewController* child_1 = [storyboard instantiateViewControllerWithIdentifier:@"allergies"];
        child_1.PatientInfo = self.PatientInfo;
        
        return child_1;
        
    }
}

//    NSString * storyboardName1 = @"Medication";
//    UIStoryboard *storyboard1 = [UIStoryboard storyboardWithName:storyboardName1 bundle: nil];
//    MedicationViewController * child_2 = [storyboard1 instantiateViewControllerWithIdentifier:@"MedicationView"];
//    child_2.PatientInfo = self.PatientInfo;



- (NSString *)titleForTabAtIndex:(NSInteger)index {
    if(index ==0){
      return @"Overview";
    }
    else  if(index ==1){
        return @"Medication";
        
    }
    else{
        
        return @"Allergies";
    }

}

- (CGFloat)tabHeight {
    // Default: 44.0f
    return 50.0f;
}

- (UIColor *)tabColor {
    // Default: [UIColor orangeColor];
    return [UIColor purpleColor];
}

- (UIColor *)tabBackgroundColor {
    // Default: [UIColor colorWithWhite:0.95f alpha:1.0f];
    return [UIColor lightTextColor];
}

- (UIFont *)titleFont {
    // Default: [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0f];
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f];
}

#pragma mark - Tab Pager Delegate

- (void)tabPager:(GUITabPagerViewController *)tabPager willTransitionToTabAtIndex:(NSInteger)index {
    NSLog(@"Will transition from tab %ld to %ld", [self selectedIndex], (long)index);
}

- (void)tabPager:(GUITabPagerViewController *)tabPager didTransitionToTabAtIndex:(NSInteger)index {
    NSLog(@"Did transition to tab %ld", (long)index);
}



@end
