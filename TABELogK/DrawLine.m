//
//  DrawLine.m
//  TABELogK
//
//  Created by oKay on 8/29/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    // 線の色を白に指定
    [[UIColor whiteColor] setStroke];
    // 線を書くUIBezierPathを生成
    UIBezierPath *line = [UIBezierPath bezierPath];
    // 線の幅を指定
    [line setLineWidth:1.3];
    // 始点を設定
    [line moveToPoint:CGPointMake(0, 0)];
    // 線を追加
    [line addLineToPoint:CGPointMake(340, 0)];
    // 線を描画
    [line stroke];
}
@end
