//
//  easyTouch.h
//  easyTouch
//
//  Created by Du on 15/7/30.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#ifndef easyTouch_easyTouch_h
#define easyTouch_easyTouch_h


#endif
#ifdef __OBJC__

#define ScreenBounds [UIScreen mainScreen].bounds
#define screenMaxX CGRectGetMaxX(ScreenBounds)
#define screenMaxY CGRectGetMaxY(ScreenBounds)
#define screenMinXY CGRectGetMinX(ScreenBounds)
#define buttonMidX CGRectGetMidX(userView.frame)
#define buttonMidY  CGRectGetMidY(userView.frame)
#define screenMidX CGRectGetMidX(ScreenBounds)
#define isButtonMidXOnMidOfScreen (buttonMidY >= screenMinXY + Margin) && (buttonMidY <= screenMaxY - Margin)
#define Margin 100

#import "UIView+Frame.h"

#endif