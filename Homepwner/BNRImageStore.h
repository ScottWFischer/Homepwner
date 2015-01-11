//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Scott Fischer on 1/4/15.
//  Copyright (c) 2015 Scott W Fischer Integration. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BNRImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;

- (UIImage *)imageForKey:(NSString *)key;

- (void)deleteImageForKey:(NSString *)key;

@end
