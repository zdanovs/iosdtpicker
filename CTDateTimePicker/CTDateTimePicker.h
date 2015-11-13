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
    @public
    NSString* module;
}

@property (strong, nonatomic) NSString* module;

-(instancetype)init;
-(NSDate*)getCurrentDate;
-(id)show:(id)sender withPresenter:(UIViewController*)presenter completeAction:(CTCompletionActionBlock)action;
-(void)dealloc;

@end
