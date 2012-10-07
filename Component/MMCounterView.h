//
//  MMCounterView.h
//
//  Created by Matthew McCroskey on 01 October 2012.
//  This work is licensed under the
//  Creative Commons Attribution-NonCommercial-ShareAlike License.
//  For more info on this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/
//

#import <UIKit/UIKit.h>

@interface MMCounterView : UIView

@property        NSInteger integer;            // Defaults to 0
@property        NSInteger truncationBoundary; // Defaults to 100
@property        CGFloat   ticksPerSecond;     // Defaults to 25.0; indicates how many animations should occur per second

@property (weak) UIColor   *textColor;         // Defaults to darkTextColor

@end
