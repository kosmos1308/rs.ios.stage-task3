#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSArray *monthArray = [[NSArray alloc] initWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December", nil];
    NSArray *monthKey = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    
    NSDictionary *monthDictionary = [[NSDictionary alloc] initWithObjects: monthArray forKeys: monthKey];
    NSMutableString *result = [NSMutableString new];
    
    if (monthNumber > 0 && monthNumber <= 12){
        NSString *key = [@(monthNumber) stringValue];
        result = [monthDictionary valueForKey: key];
    } else {
        result = nil;
    }
    return result;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        
        NSDateComponents *component = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:[dateFormatter dateFromString:date]];
        NSInteger day = [component day];
        return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"EEE";
        NSLocale *ruLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
        dateFormatter.locale = ruLocale;
        NSString *dayName = [dateFormatter stringFromDate:date];
        return dayName;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *today = [NSDate now];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *myWeekComponent = [calendar components:NSCalendarUnitWeekOfYear fromDate: today];
        NSDateComponents *weekComponent = [calendar components:NSCalendarUnitWeekOfYear fromDate: date];

        BOOL answer;
        if (myWeekComponent.weekOfYear == weekComponent.weekOfYear){
            answer = YES;
        } else{
            answer = NO;
        }
        return answer;
}

@end
