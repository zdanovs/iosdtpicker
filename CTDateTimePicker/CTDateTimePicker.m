//
//  CTDateTimePicker.m
//  CTDateTimePicker
//
//  Created by Oleg Kertanov on 12/11/15.
//  Copyright © 2015 Oleg Kertanov. All rights reserved.
//

#import "CTDateTimePicker.h"
#import "RMDateSelectionViewController/RMDateSelectionViewController.h"

@interface CTDateTimePicker ()

@property (copy, atomic) NSDate* initialDate;
@property (strong, atomic) NSDate* lastSelectedDateBacking;
@property (assign, nonatomic) CTDateTimePickerStyle timePickerStyle;

-(void)invokeAction:(CTCompletionActionBlock)action withDate:(NSDate*)date;

@end

@implementation CTDateTimePicker

@synthesize module;
@synthesize currentDate;
@synthesize lastSelectedDate;

@synthesize initialDate;
@synthesize lastSelectedDateBacking;
@synthesize timePickerStyle;

-(instancetype)init {
    CTDateTimePicker* xself = [self init:[NSDate date]];
    return xself;
}

-(instancetype)init:(NSDate*)date {
    self = [super init];
    
    if (self) {
        module = NSStringFromClass([self class]);
        initialDate = date;
    }
    
    return self;
}

-(NSDate*)currentDate {
    NSDate* date = [NSDate date];
    return date;
}

-(NSDate*)lastSelectedDate {
    return lastSelectedDateBacking;
}

-(id)show:(id)sender withPresenter:(UIViewController*)presenter completeAction:(CTCompletionActionBlock)action {
    return [self openDateSelectionController:sender withPresenter:presenter completeAction:action];
}

-(void)dealloc {
    module = nil;
}

- (id)openDateSelectionController:(id)sender withPresenter:(UIViewController*)presenter completeAction:(CTCompletionActionBlock)action {
    // Black or White popup style
    RMActionControllerStyle style = timePickerStyle == CTDateTimePickerStyleBlack ? RMActionControllerStyleBlack : RMActionControllerStyleWhite;
    
    RMAction<RMActionController<UIDatePicker *> *> *selectAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"Select" style:RMActionStyleDone andHandler:^(RMActionController<UIDatePicker *> *controller) {
        NSLog(@"Successfully selected date: %@", controller.contentView.date);
        
        [self invokeAction:action withDate:controller.contentView.date];
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
        
        [self invokeAction:action withDate:controller.contentView.date];
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    in15MinAction.dismissesActionController = NO;
    
    RMAction<RMActionController<UIDatePicker *> *> *in30MinAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"30 Min" style:RMActionStyleAdditional andHandler:^(RMActionController<UIDatePicker *> *controller) {
        controller.contentView.date = [NSDate dateWithTimeIntervalSinceNow:30*60];
        NSLog(@"30 Min button tapped");
        
        [self invokeAction:action withDate:controller.contentView.date];
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    in30MinAction.dismissesActionController = NO;
    
    RMAction<RMActionController<UIDatePicker *> *> *in45MinAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"45 Min" style:RMActionStyleAdditional andHandler:^(RMActionController<UIDatePicker *> *controller) {
        controller.contentView.date = [NSDate dateWithTimeIntervalSinceNow:45*60];
        NSLog(@"45 Min button tapped");
        
        [self invokeAction:action withDate:controller.contentView.date];
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    in45MinAction.dismissesActionController = NO;
    
    RMAction<RMActionController<UIDatePicker *> *> *in60MinAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"60 Min" style:RMActionStyleAdditional andHandler:^(RMActionController<UIDatePicker *> *controller) {
        controller.contentView.date = [NSDate dateWithTimeIntervalSinceNow:60*60];
        NSLog(@"60 Min button tapped");
        
        [self invokeAction:action withDate:controller.contentView.date];
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    in60MinAction.dismissesActionController = NO;
    
    RMGroupedAction<RMActionController<UIDatePicker *> *> *groupedAction = [RMGroupedAction<RMActionController<UIDatePicker *> *> actionWithStyle:RMActionStyleAdditional andActions:@[in15MinAction, in30MinAction, in45MinAction, in60MinAction]];
    
    [dateSelectionController addAction:groupedAction];
    
    /*
     TODO: okertanov: now action disabled by request
    RMAction<RMActionController<UIDatePicker *> *> *nowAction = [RMAction<RMActionController<UIDatePicker *> *> actionWithTitle:@"Now" style:RMActionStyleAdditional andHandler:^(RMActionController<UIDatePicker *> * _Nonnull controller) {
        controller.contentView.date = [NSDate date];
        NSLog(@"Now button tapped");
    }];
    nowAction.dismissesActionController = NO;
    
    [dateSelectionController addAction:nowAction];
    */
    
    //You can access the actual UIDatePicker via the datePicker property
    dateSelectionController.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    dateSelectionController.datePicker.minuteInterval = 1;
    dateSelectionController.datePicker.date = [self initialDate];
    
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

-(void)invokeAction:(CTCompletionActionBlock)action withDate:(NSDate*)date {
    self.lastSelectedDateBacking = date;
    
    if (action != nil) {
        action(self.lastSelectedDateBacking);
    }
}

@end
