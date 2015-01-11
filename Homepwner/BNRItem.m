//
//  BNRItem.m
//  RandomItems
//
//  Created by Scott Fischer on 12/24/14.
//  Copyright (c) 2014 Scott W Fischer Integration. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
    self = [super init];
    
    if (self) {
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc] init];
        
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _itemKey = key;
    }
    
    return self;
}

+ (instancetype)randomItem
{
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0 serialNumber:@""];
}

- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:sNumber];
}

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}



- (NSString *)description {
    NSString *descriptionString = [[NSString alloc]
                                   initWithFormat:@"%@ (%@): Worth $%d, recorded on  %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

- (void) dealloc
{
    NSLog(@"Destroyed: %@", self);
}

@end
