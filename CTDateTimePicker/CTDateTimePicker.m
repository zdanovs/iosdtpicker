//
//  CTDateTimePicker.m
//  CTDateTimePicker
//
//  Created by Oleg Kertanov on 12/11/15.
//  Copyright © 2015 Oleg Kertanov. All rights reserved.
//

#import "CTDateTimePicker.h"
#import "RMDateSelectionViewController/RMDateSelectionViewController.h"

@implementation CTDateTimePicker

@synthesize module;

-(instancetype)init {
    self = [super init];
    
    if (self) {
        self.module = NSStringFromClass([self class]);
    }
    
    return self;
}

-(NSDate*)getCurrentDate {
    NSDate* currentDate = [NSDate date];
    
    return currentDate;
}

-(id)show:(id)sender withPresenter:(UIViewController*)presenter completeAction:(CTCompletionActionBlock)action {
    return [self openDateSelectionController:sender withPresenter:presenter completeAction:action];
}

-(void)dealloc {
    self.module = nil;
}

- (id)openDateSelectionController:(id)sender withPresenter:(UIViewController*)presenter completeAction:(CTCompletionActionBlock)action {
    // Black or White popup style
    RMActionControllerStyle style = YES ? RMActionControllerStyleBlack : RMActionControllerStyleWhite;
    
    RMAction<RMActionController<UIDatePicker *> *> *selectAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"Select" style:RMActionStyleDone andHandler:^(RMActionController<UIDatePicker *> *controller) {
        NSLog(@"Successfully selected date: %@", controller.contentView.date);
        
        if (action != nil) {
            action(controller.contentView.date);
        }
    }];
    
    RMAction<RMActionController<UIDatePicker *> *> *cancelAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"Cancel" style:RMActionStyleCancel andHandler:^(RMActionController<UIDatePicker *> *controller) {
        NSLog(@"Date selection was canceled");
    }];
    
    RMDateSelectionViewController *dateSelectionController = [RMDateSelectionViewController actionControllerWithStyle:style];
    dateSelectionController.title = @"";
    dateSelectionController.message = @"Please choose a date and press 'Select' or 'Cancel'.";
    
    [dateSelectionController addAction:selectAction];
    [dateSelectionController addAction:cancelAction];
    
    // You can enable or disable blur, bouncing and motion effects
    dateSelectionController.disableBouncingEffects = YES;
    dateSelectionController.disableMotionEffects = YES;
    dateSelectionController.disableBlurEffects = YES;
    
    RMAction<RMActionController<UIDatePicker *> *> *in15MinAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"15 Min" style:RMActionStyleAdditional andHandler:^(RMActionController<UIDatePicker *> *controller) {
        controller.contentView.date = [NSDate dateWithTimeIntervalSinceNow:15*60];
        NSLog(@"15 Min button tapped");
    }];
    in15MinAction.dismissesActionController = NO;
    
    RMAction<RMActionController<UIDatePicker *> *> *in30MinAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"30 Min" style:RMActionStyleAdditional andHandler:^(RMActionController<UIDatePicker *> *controller) {
        controller.contentView.date = [NSDate dateWithTimeIntervalSinceNow:30*60];
        NSLog(@"30 Min button tapped");
    }];
    in30MinAction.dismissesActionController = NO;
    
    RMAction<RMActionController<UIDatePicker *> *> *in45MinAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"45 Min" style:RMActionStyleAdditional andHandler:^(RMActionController<UIDatePicker *> *controller) {
        controller.contentView.date = [NSDate dateWithTimeIntervalSinceNow:45*60];
        NSLog(@"45 Min button tapped");
    }];
    in45MinAction.dismissesActionController = NO;
    
    RMAction<RMActionController<UIDatePicker *> *> *in60MinAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"60 Min" style:RMActionStyleAdditional andHandler:^(RMActionController<UIDatePicker *> *controller) {
        controller.contentView.date = [NSDate dateWithTimeIntervalSinceNow:60*60];
        NSLog(@"60 Min button tapped");
    }];
    in60MinAction.dismissesActionController = NO;
    
    RMGroupedAction<RMActionController<UIDatePicker *> *> *groupedAction = [RMGroupedAction<RMActionController<UIDatePicker *> *> actionWithStyle:RMActionStyleAdditional andActions:@[in15MinAction, in30MinAction, in45MinAction, in60MinAction]];
    
    [dateSelectionController addAction:groupedAction];
    
    RMAction<RMActionController<UIDatePicker *> *> *nowAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"Now" style:RMActionStyleAdditional andHandler:^(RMActionController<UIDatePicker *> * _Nonnull controller) {
        controller.contentView.date = [NSDate date];
        NSLog(@"Now button tapped");
    }];
    nowAction.dismissesActionController = NO;
    
    [dateSelectionController addAction:nowAction];
    
    //You can access the actual UIDatePicker via the datePicker property
    dateSelectionController.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    dateSelectionController.datePicker.minuteInterval = 1;
    dateSelectionController.datePicker.date = [NSDate date];
    
    //On the iPad we want to show the date selection view controller within a popover. Fortunately, we can use iOS 8 API for this! :)
    //(Of course only if we are running on iOS 8 or later)
    if([dateSelectionController respondsToSelector:@selector(popoverPresentationController)] && [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        //First we set the modal presentation style to the popover style
        dateSelectionController.modalPresentationStyle = UIModalPresentationPopover;
        
        //Then we tell the popover presentation controller, where the popover should appear
        UIView* sourceView = [presenter view];
        CGRect sourceRect = [sourceView frame];
        dateSelectionController.popoverPresentationController.sourceView = sourceView;
        dateSelectionController.popoverPresentationController.sourceRect = sourceRect;
    }
    
    //Now just present the date selection controller using the standard iOS presentation method
    [presenter presentViewController:dateSelectionController animated:YES completion:nil];
    
    return dateSelectionController;
}

@end
