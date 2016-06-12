//
//  FISSentence.h
//  objc-fissentence
//
//  Created by Flatiron School on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property (nonatomic, readonly) NSString* sentence;
@property (nonatomic, strong) NSMutableArray* words;
@property (nonatomic, strong) NSString* punctuation;

-(void)addWord: (NSString*)word;
-(void)addWords:(NSArray*)words withPunctuation:(NSString*)punctuation;
-(void)removeWordAtIndex: (NSUInteger)index;
-(void)insertWord: (NSString*)word atIndex: (NSUInteger)index;
-(void)replacePunctuationWithPunctuation: (NSString*)punctuation;
-(void)replaceWordAtIndex: (NSUInteger)index withWord:(NSString*)word;

@end
