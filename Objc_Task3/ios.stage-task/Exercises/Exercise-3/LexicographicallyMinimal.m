#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *firstString = [NSMutableString stringWithString:string1];
    NSMutableString *secondString = [NSMutableString stringWithString:string2];
    NSMutableString *resultString = [NSMutableString new];
        
        while ((firstString.length != 0) && (secondString.length != 0)) {
            if ([firstString UTF8String][0] <= [secondString UTF8String][0]) {
                [resultString appendFormat:@"%c", [firstString characterAtIndex:0]];
                [firstString deleteCharactersInRange:NSMakeRange(0, 1)];
            } else {
                [resultString appendFormat:@"%c", [secondString characterAtIndex:0]];
                [secondString deleteCharactersInRange:NSMakeRange(0, 1)];
            }
        }
        if ([firstString length] == 0) {
            [resultString appendString:secondString];
        } else {
            [resultString appendString:firstString];
        }
        
        return resultString;
}

@end
