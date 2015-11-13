//
//  ViewController.h
//  CTDateTimePickerLibTest
//
//  Created by Oleg Kertanov on 13/11/15.
//  Copyright © 2015 CTCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *pickDateButton;
- (IBAction)onPickDateButton:(UIButton *)sender forEvent:(UIEvent *)event;

@end

