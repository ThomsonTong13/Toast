//
//  UIView+Toast.m
//  Toast
//
//  Created by Thomson on 15/11/24.
//  Copyright © 2015年 Kemi. All rights reserved.
//

#import "UIView+Toast.h"

static CGFloat const kOffsetY = 110.0;

@implementation UIView (Toast)

- (void)showToastWithText:(NSString *)text time:(NSTimeInterval)time
{
    CGFloat maxWidth = self.window.bounds.size.width - kOffsetY;

    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor colorWithWhite:.3f alpha:.7f];
    label.textColor = [UIColor whiteColor];
    label.layer.cornerRadius = 6.0f;
    label.layer.masksToBounds = YES;

    label.text = text;

    CGSize size = CGSizeMake(maxWidth, CGFLOAT_MAX);

    CGRect rect = [label.text boundingRectWithSize:size
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{ NSFontAttributeName :label.font }
                                           context:nil];

    rect.size.height = MAX(30.0f, rect.size.height + 10.0f);
    rect.size.width += 10.0f;
    rect.origin.y = self.window.bounds.size.height - (rect.size.height / 2) - 105.0f;
    rect.origin.x = (self.window.bounds.size.width - rect.size.width) / 2;

    label.frame = rect;

    [self.window addSubview:label];

    [UIView animateWithDuration:.5f
                          delay:time
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                            label.alpha = 0;
                        }
                     completion:^(BOOL finished) {
                         [label removeFromSuperview];
                     }];
}

@end
