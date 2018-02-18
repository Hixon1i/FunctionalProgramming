//
//  ViewController.m
//  FunctionalProgramming
//
//  Created by Pavel Samsonov on 18/02/2018.
//  Copyright © 2018 MegaLabs. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+F.h"
#import "NSDictionary+F.h"
//#import "NSNumber+F.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *numberArray = [NSArray arrayFrom:1 To:5];
    NSArray *numberNamesArray = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", @"five", nil];
    NSDictionary *numberDict = [NSDictionary dictionaryWithObjects:numberArray forKeys:numberNamesArray];
    
//    [numberArray each:^(id obj) {
//        NSLog(@"%@", obj);
//    }];
    
//    [numberDict each:^(id key, id value) {
//        NSLog(@"key: %@, value: %@", key, value);
//    }];
    
//    NSArray *doubleArray = [numberArray map:^NSNumber *(NSNumber *obj) {
//        return [NSNumber numberWithInteger:[obj integerValue] * 2];
//    }];
//
//    NSLog(@"%@", doubleArray);
    
//    NSDictionary *doubleDict = [numberDict map:^NSNumber *(NSString *key, NSNumber *obj) {
//        return [NSNumber numberWithInteger:[obj integerValue] * 2];
//    }];
//
//    NSLog(@"%@", doubleDict);
    
//    NSNumber *memo = [NSNumber numberWithInteger:0];
//
//    NSNumber *sumArray = [numberArray reduce:^NSNumber *(NSNumber *memo, NSNumber *obj) {
//
//        return [NSNumber numberWithInteger:[memo integerValue] + [obj integerValue]];
//    } withInitialMemo:memo];
//    NSLog(@"%ld", (long)sumArray.integerValue);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end























