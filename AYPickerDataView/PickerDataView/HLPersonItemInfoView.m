//
//  HLPersonInfoView.m
//  SmartCoach
//
//  Created by AlexYang on 15/7/31.
//  Copyright (c) 2015年 SmartCoach. All rights reserved.
//

#import "HLPersonItemInfoView.h"
//#import "UILabel+StringFrame.h"
#import "const.h"

@implementation HLPersonItemInfoView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *itemName = [[UILabel alloc] init];
        UILabel *itemValue = [[UILabel alloc] init];
        UILabel *itemUnit   = [[UILabel alloc] init];
        itemUnit.font = [UIFont systemFontOfSize:12.0];
        itemName.font = [UIFont systemFontOfSize:12.0];
        itemValue.font = [UIFont systemFontOfSize:20.0];
        itemValue.textColor = [UIColor whiteColor];
        itemValue.textAlignment = NSTextAlignmentRight;
        
        itemName.textColor = [UIColor colorWithWhite:1.0 alpha:0.6];
        itemName.textAlignment = NSTextAlignmentRight;
        itemUnit.textColor = [UIColor colorWithWhite:1.0 alpha:0.6];
        itemUnit.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:itemName];
        [self addSubview:itemValue];
        [self addSubview:itemUnit];
        self.itemNameLabel = itemName;
        self.itemValueLabel = itemValue;
        self.itemUnitLabel = itemUnit;
    }
    return self;
}


-(void)layoutSubviews
{
    UIView *containView = self;
    NSString *tempStr = self.itemValueLabel.text;
    NSString *strForCalculateMaxframe = @"888";
    self.itemValueLabel.text = strForCalculateMaxframe;
    //当最大值时，计算Max size
    CGSize itemValueSize = [self.itemValueLabel boundingRectWithSize:CGSizeMake(0, 0)];
    self.itemValueLabel.text = tempStr;
    CGSize itemSize = [self.itemNameLabel boundingRectWithSize:CGSizeMake(0, 0)];
    self.itemNameLabel.frame = CGRectMake(containView.width - itemValueSize.width, 0, itemValueSize.width, itemSize.height);
    

    CGFloat itemY = self.itemNameLabel.y + self.itemNameLabel.height;
    self.itemValueLabel.frame = CGRectMake(containView.width - itemValueSize.width, itemY, itemValueSize.width, itemValueSize.height);
    
    itemY = self.itemValueLabel.y + self.itemValueLabel.height;
    itemSize = [self.itemUnitLabel boundingRectWithSize:CGSizeMake(0, 0)];
    self.itemUnitLabel.frame = CGRectMake(containView.width - itemValueSize.width, itemY, itemValueSize.width, itemSize.height);
}

+(instancetype)viewWithFrame:(CGRect)frame itemName:(NSString *)name Unit:(NSString *)unit andValue:(NSNumber *)value
{
    HLPersonItemInfoView *infoView = [[HLPersonItemInfoView alloc] initWithFrame:frame];
    infoView.itemNameLabel.text = name;
    infoView.itemValueLabel.text = [value stringValue];
    infoView.itemUnitLabel.text = unit;
    infoView.itemValue = value;
    
    return infoView;
}

-(void)setItemValue:(NSNumber *)itemValue
{
    _itemValue = itemValue;
    _itemValueLabel.text = [itemValue stringValue];
}

@end
