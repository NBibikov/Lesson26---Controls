//
//  ViewController.h
//  Lesson26 - Controls
//
//  Created by Nick Bibikov on 11/25/14.
//  Copyright (c) 2014 Nick Bibikov. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NBColorSchemeTypeRGB,
    NBColorSchemeTypHSV
    
} NBColorSchemeType;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UILabel *testLabel2;
@property (weak, nonatomic) IBOutlet UISlider *redComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueComponentSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSchemeControl;

@property (assign, nonatomic) NSInteger NBColorSchemeType;

- (IBAction)testSlider:(UISlider *)sender;
- (IBAction)testSwitch:(UISwitch *)sender;


@end

