//
//  UILabel+Fit.m
//  XYScreenFitDemo
//
//  Created by xiaoyuyu on 17/6/1.
//  Copyright © 2017年 xiaoyu. All rights reserved.
//

#import "UILabel+Fit.h"
#import <objc/runtime.h>

#define p [UIScreen mainScreen].bounds.size.width / 320.0


@implementation UILabel (Fit)

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
            [self fit];
        }
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self fit];
}

-(void)fit {
    [self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.identifier.length > 0) {
            
            obj.constant = obj.constant *p;
        }
    }];
    
    [self.superview.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.identifier.length > 0) {
            
            obj.constant = obj.constant *p;
        }
    }];
}
@end
