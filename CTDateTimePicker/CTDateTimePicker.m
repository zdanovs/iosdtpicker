//
//  CTDateTimePicker.m
//  CTDateTimePicker
//
//  Created by Oleg Kertanov on 12/11/15.
//  Copyright © 2015 Oleg Kertanov. All rights reserved.
//

#import "CTDateTimePicker.h"

@implementation CTDateTimePicker

@synthesize module;

-(instancetype)init {
    self = [super init];
    
    if (self) {
        self.module = NSStringFromClass([self class]);
    }
    
    return self;
}

-(void)dealloc {
    self.module = nil;
}

@end
