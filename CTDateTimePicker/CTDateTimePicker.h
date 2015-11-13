//
//  CTDateTimePicker.h
//  CTDateTimePicker
//
//  Created by Oleg Kertanov on 12/11/15.
//  Copyright © 2015 Oleg Kertanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTDateTimePicker : NSObject {
    @public
    NSString* module;
}

@property (strong, nonatomic) NSString* module;

-(instancetype)init;
-(void)dealloc;

@end
