//
//  UITextView+Fit.m
//  XYScreenFitDemo
//
//  Created by xiaoyuyu on 17/6/29.
//  Copyright © 2017年 xiaoyu. All rights reserved.
//

#import "UITextView+Fit.h"
#import <objc/runtime.h>

#define p [UIScreen mainScreen].bounds.size.width / 320.0

@implementation UITextView (Fit)
+ (void)load{
    Method iwc = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method fiwc = class_getInstanceMethod([self class], @selector(fitInitWithCoder:));
    method_exchangeImplementations(iwc, fiwc);
}

- (id)fitInitWithCoder:(NSCoder*)aDecode{
    [self fitInitWithCoder:aDecode];
    if (self) {
        if(self.tag != 8989){
            NSString *fontName = self.font.fontName;
            CGFloat fontSize = self.font.pointSize;
            self.font = [UIFont fontWithName:fontName size:fontSize*p];
        }
    }
    return self;
}
@end
