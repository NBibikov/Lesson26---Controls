//
//  ViewController.m
//  Lesson26 - Controls
//
//  Created by Nick Bibikov on 11/25/14.
//  Copyright (c) 2014 Nick Bibikov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self refreshScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method

- (void) refreshScreen {
    
    
    UIView* testView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 150/2, 200, 150, 150)];
    testView.layer.cornerRadius = 10;
    [self.view addSubview:testView];
    
    CGFloat red = self.redComponentSlider.value;
    CGFloat green = self.greenComponentSlider.value;
    CGFloat blue = self.blueComponentSlider.value;
    
    
    UIColor* color = nil;
    
    if (self.colorSchemeControl.selectedSegmentIndex == NBColorSchemeTypeRGB) {
        
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
    }
    
    else {
        
        color = [UIColor colorWithHue:red saturation:green brightness:blue alpha:1.f];
    }
    
    CGFloat hue, saturation, brightness, alpha;
    NSString* result = @"";
    NSString* result2 = @"";
    
    if ([color getRed:&red green:&green blue:&blue alpha:&alpha]) {
        
        result = [result stringByAppendingFormat:@"RGB: %1.2f, %1.2f, %1.2f", red*255, green*255, blue*255];
    } else {
        
        result = [result stringByAppendingFormat:@"RGB: {NO DATA}"];
    }
    
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {

        result2 = [result2 stringByAppendingFormat:@"HSV: %1.2f, %1.2f, %1.2f", hue, saturation, brightness];
    } else {
        
        result2 = [result2 stringByAppendingFormat:@"HSV: {NO DATA}"];
    }
    
    
    self.testLabel.text = result;
    self.testLabel2.text = result2;
    
    testView.backgroundColor = color;
}

#pragma mark - testAction

- (IBAction)testSlider:(UISlider *)sender {
    
    
    
    [self refreshScreen];
}

- (IBAction)testSwitch:(UISwitch *)sender {
    
    self.redComponentSlider.enabled = self.greenComponentSlider.enabled = self.blueComponentSlider.enabled = sender.isOn;
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
    });
}



@end
