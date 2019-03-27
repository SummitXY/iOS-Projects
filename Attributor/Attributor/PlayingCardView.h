//
//  PlayingCardView.h
//  Attributor
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) NSString* suit;
@property (nonatomic) BOOL faceUp;

@end

NS_ASSUME_NONNULL_END
