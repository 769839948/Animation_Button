//
//  Animation.h
//  Animation_button
//
//  Created by Jane on 8/9/15.
//  Copyright (c) 2015 Jane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface Animation : NSObject

+(CABasicAnimation *)opacityForever_Animation:(float)time;
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time;
+(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x;

+(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes;
@end
