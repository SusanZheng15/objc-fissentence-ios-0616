//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Flatiron School on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence()

@property (nonatomic, readwrite) NSString* sentence;




@end

@implementation FISSentence

//Private Methods
-(void)assembleSentence
{
    self.sentence = [[self.words componentsJoinedByString:@" "]stringByAppendingString:self.punctuation];
}

-(BOOL)validWord:(NSString*)word
{
    if ([word length] > 0 && ![word isEqualToString: @" "] && ![word isEqualToString:@""])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(BOOL)validPunctuation: (NSString*)punctuation
{
    NSArray *punctuationArray = @[@".", @"?", @"!", @",", @";", @":", @"-"];
    if((![punctuationArray containsObject:punctuation]))
    {
        return NO;
    }
    else
    {
        self.punctuation = punctuation;
    }
    
    return YES;
}

-(BOOL)validIndex: (NSUInteger)index
{
    if(index < [self.words count])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    return YES;
}

//Public Methods
-(void)addWord:(NSString *)word
{
    if([self validWord: word])
    {
        [self.words addObject:word];
    }
    [self assembleSentence];
}
-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation
{
    for (NSString *word in words)
    {
        if (words == nil || ([words count] == 0))
        {
            return;
        }
        else
        {
            if([self validWord:word] && [self validPunctuation:punctuation])
            {
                [self.words addObject: word];
            }
        
        }
        
        
    }
    [self assembleSentence];
}
-(void)removeWordAtIndex:(NSUInteger)index
{
    if([self validIndex:index])
    {
        [self.words removeObjectAtIndex:index];
    }
    [self assembleSentence];
}
-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index
{
    if ([self validWord:word] && [self validIndex:index])
    {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}
-(void)replacePunctuationWithPunctuation:(NSString *)punctuation
{
    if([self validPunctuation:punctuation])
    {
        self.punctuation = punctuation;
    }
    [self assembleSentence];
}
-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word
{
    if ([self validIndex:index] && [self validWord:word])
    {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];
}
@end
