//
//  CTDateTimePicker.h
//  CTDateTimePicker
//
//  Created by Oleg Kertanov on 12/11/15.
//  Copyright © 2015 Oleg Kertanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CTCompletionActionBlock)(NSDate* selectedDate);

@interface CTDateTimePicker : NSObject {
    NSString* module;
    NSDate* currentDate;
    NSDate* lastSelectedDate;
}

@property (strong, readonly, nonatomic) NSString* module;
@property (strong, readonly, atomic) NSDate* currentDate;
@property (strong, readonly, atomic) NSDate* lastSelectedDate;

-(instancetype)init;
-(instancetype)init:(NSDate*)date;
-(id)show:(id)sender withPresenter:(UIViewController*)presenter completeAction:(CTCompletionActionBlock)action;
-(void)dealloc;

@end
