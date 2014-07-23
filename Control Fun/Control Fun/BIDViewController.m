//
//  BIDViewController.m
//  Control Fun
//
//  Created by Dexter Launchlabs on 7/23/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [_doSomethingButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"bluebutton.png"];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:(0)];
    [_doSomethingButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender{
    [_nameField resignFirstResponder];
    [_numberField resignFirstResponder];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)roundf(slider.value);
    _sliderLabel.text = [NSString stringWithFormat:@"%d", progressAsInt];
}

- (IBAction)switchChanged:(id)sender {
    UISwitch *whichSwitch = (UISwitch *)sender;
    BOOL setting = whichSwitch.isOn;
    [_leftSwitch setOn:setting animated:YES];
    [_RightSwitch setOn:setting animated:YES];
}

- (IBAction)toggleControls:(id)sender {
    // 0 ==switches index
    if ([sender selectedSegmentIndex] == 0 ) {
        _leftSwitch.hidden = NO;
        _RightSwitch.hidden = NO;
        _doSomethingButton.hidden = YES;
    }
    else{
        _leftSwitch.hidden = YES;
        _RightSwitch.hidden = YES;
        _doSomethingButton.hidden = NO;
    }
}

- (IBAction)buttonPressed:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Are you sure" delegate:self cancelButtonTitle:@"No Way" destructiveButtonTitle:@"Yes, I'm sure" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        NSString *msg = nil;
        
        if (_nameField.text.length > 0) {
            msg = [[NSString alloc] initWithFormat:@"You can breathe easy, %@, everything went OK.",_nameField.text];
        }
        else
            msg = @"You can breath easy, everything went OK.";
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Something was done" message:msg delegate:self cancelButtonTitle:@"Phew!" otherButtonTitles:nil];
        [alert show];
    }
}
@end
