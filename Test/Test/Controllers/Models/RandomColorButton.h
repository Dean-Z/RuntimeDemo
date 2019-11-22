//
//  RandomColorButton.h
//  Test
//
//  Created by Jason on 2019/11/22.
//  Copyright © 2019 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RamdonColor  (arc4random()%255 / 255.f)

@interface RandomColorButton : UIButton

@end

