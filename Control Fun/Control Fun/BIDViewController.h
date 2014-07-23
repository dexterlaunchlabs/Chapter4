//
//  BIDViewController.h
//  Control Fun
//
//  Created by Dexter Launchlabs on 7/23/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController <UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *numberField;
@property (strong, nonatomic) IBOutlet UILabel *sliderLabel;
@property (strong, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *RightSwitch;
@property (strong, nonatomic) IBOutlet UIButton *doSomethingButton;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)sliderChanged:(UISlider *)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)toggleControls:(id)sender;
- (IBAction)buttonPressed:(id)sender;
@end
