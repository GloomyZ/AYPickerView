//
//  HLPickerScrollView.m
//  SmartCoach
//
//  Created by AlexYang on 15/7/31.
//  Copyright (c) 2015年 SmartCoach. All rights reserved.
//

#import "HLPickerScrollView.h"
#import "HLMeasureView.h"
#import "const.h"
/**
 *  measureView start to draw ruler position
 */
static CGFloat sStartPoint = 11.0;

@interface HLPickerScrollView ()
@property (nonatomic, weak) HLMeasureView *measureView;
@property (nonatomic , strong) NSNumber *max;
@property (nonatomic , strong) NSNumber *min;
@end

@implementation HLPickerScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setDefaultParameters];
    }
    return self;
}

-(void)setDefaultParameters {
    
    if (UI_IS_IPHONE5) {
        sStartPoint = 11;
    }else if (UI_IS_IPHONE6) {
        sStartPoint = 39;
    } else if (UI_IS_IPHONE6PLUS) {
        sStartPoint = 58;
    } else {
        sStartPoint = 11;
        NSLog(@"undefine iPhone screen");
    }
}

+(instancetype)viewWithFrame:(CGRect)frame valueDefault:(NSNumber *)value RangeFrom:(NSNumber *)min toMax:(NSNumber *)max andScaleColor:(UIColor *)scaleColor
{
    const NSInteger unitPerPixel = 10;
    HLPickerScrollView *pickerScroll = [[HLPickerScrollView alloc] initWithFrame:frame];
    CGFloat W  = ([max intValue]- [min intValue])*unitPerPixel;
    pickerScroll.contentSize = CGSizeMake(W, frame.size.height);
    pickerScroll.alwaysBounceHorizontal = YES;
    pickerScroll.bounces = YES;
    pickerScroll.scrollEnabled = YES;
    pickerScroll.showsHorizontalScrollIndicator = NO;
    pickerScroll.max = max;
    pickerScroll.min = min;
    pickerScroll.contentInset = UIEdgeInsetsMake(0, (frame.size.width / 2) - sStartPoint, 0, frame.size.width/2 + sStartPoint + 2);
    
    HLMeasureView *measureView = [HLMeasureView viewWithFrame:CGRectMake(0, 0, pickerScroll.contentSize.width, pickerScroll.frame.size.height) valueRangeFrom:min toMax:max andStartPosition:sStartPoint valueLabelColor:scaleColor];
    pickerScroll.measureView = measureView;
    [pickerScroll addSubview:measureView];
    
//    [pickerScroll addGradientLayer:pickerScroll.bounds];
    return pickerScroll;
}

//-(void)addGradientLayer:(CGRect)frame {
//    CAGradientLayer *gLayer = [[CAGradientLayer alloc] init];
//    gLayer.frame = self.bounds;
//    gLayer.colors = @[(__bridge id)[UIColor colorWithWhite:0.0 alpha:0.8].CGColor, (__bridge id)[UIColor colorWithWhite:0.0 alpha:0.0].CGColor,
//                      (__bridge id)[UIColor colorWithWhite:0.0 alpha:0.8].CGColor];
//    gLayer.locations = @[@0.0, @0.5, @1.0];
//    gLayer.startPoint = CGPointMake(0, 0.5);
//    gLayer.endPoint  =  CGPointMake(1, 0.5);
//    
//    [self.layer addSublayer:gLayer];
//}


@end
