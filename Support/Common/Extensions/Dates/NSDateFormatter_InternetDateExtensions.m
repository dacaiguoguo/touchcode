//
//  NSDateFormatter_InternetDateExtensions.m
//  UnitTesting
//
//  Created by Jonathan Wight on 5/16/09.
//  Copyright 2009 Small Society. All rights reserved.
//

#import "NSDateFormatter_InternetDateExtensions.h"

struct SDateFormatTimeZonePair {
	NSString *dateFormat;
	NSString *timezone;
};

@implementation NSDateFormatter (NSDateFormatter_InternetDateExtensions)

//http://unicode.org/reports/tr35/tr35-4.html#Date_Format_Patterns
//http://www.faqs.org/rfcs/rfc2822.html
//http://en.wikipedia.org/wiki/ISO_8601

+ (NSDateFormatter *)RFC2822Formatter;
{
NSDateFormatter *theFormatter = [[[NSDateFormatter alloc] init] autorelease];
[theFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
[theFormatter setDateFormat:@"EEE, d MMM yy HH:mm:ss ZZ"];
return(theFormatter);
}

+ (NSDateFormatter *)ISO8601Formatter
{
NSDateFormatter *theFormatter = [[[NSDateFormatter alloc] init] autorelease];
[theFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
[theFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
[theFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
return(theFormatter);
}

+ (NSArray *)allRFC2822DateFormatters
{
NSArray *sFormatters = NULL;

@synchronized(self)
	{
	if (sFormatters == NULL)
		{
		struct SDateFormatTimeZonePair thePairs[] = {
			{ .dateFormat = @"EEE, d MMM yy HH:mm:ss ZZ" },
			{ .dateFormat = @"EEE, d MMM yy HH:mm:ss zzz" },
			{ .dateFormat = @"EEE, d MMM yy HH:mm:ss 'Z'", @"UTC", },
			{ NULL, NULL },
			};
		
		NSMutableArray *theFormatters = [NSMutableArray array];
		for (int N = 0; thePairs[N].dateFormat != NULL; ++N)
			{
			NSDateFormatter *theFormatter = [[[NSDateFormatter alloc] init] autorelease];
			[theFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
			[theFormatter setDateFormat:thePairs[N].dateFormat];
			if (thePairs[N].timezone)
				[theFormatter setTimeZone:[NSTimeZone timeZoneWithName:thePairs[N].timezone]];
			
			[theFormatters addObject:theFormatter];
			}


		sFormatters = [theFormatters copy];
		}
	}
return(sFormatters);
}

+ (NSArray *)allISO8601DateFormatters
{
NSArray *sFormatters = NULL;

@synchronized(self)
	{
	if (sFormatters == NULL)
		{
		struct SDateFormatTimeZonePair thePairs[] = {
			{ .dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'", .timezone = @"UTC" },
			{ .dateFormat = @"yyyyMMdd'T'HHmmss'Z'", .timezone = @"UTC" },
			{ .dateFormat = @"HH:mm:ss'Z'", .timezone = @"UTC" },
			{ .dateFormat = @"HHmmss'Z'", .timezone = @"UTC" },
			{ .dateFormat = @"HH:mm:ss'Z'", .timezone = @"UTC" },
			{ .dateFormat = @"HHmmss'Z'", .timezone = @"UTC" },
			{ .dateFormat = @"yyyy-MM-dd", .timezone = @"UTC" },
			{ .dateFormat = @"yyyyMMdd", .timezone = @"UTC" },
			{ .dateFormat = @"HH:mm:ssZZ" },
			{ .dateFormat = @"HHmmssZZ" },
			{ .dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZZ" },
			{ .dateFormat = @"yyyyMMdd'T'HHmmssZZ" },
			{ NULL, NULL },
			};
		
		NSMutableArray *theFormatters = [NSMutableArray array];
		for (int N = 0; thePairs[N].dateFormat != NULL; ++N)
			{
			NSDateFormatter *theFormatter = [[[NSDateFormatter alloc] init] autorelease];
			[theFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
			[theFormatter setDateFormat:thePairs[N].dateFormat];
			[theFormatter setDefaultDate:NULL];
			[theFormatter setLenient:NO];
			if (thePairs[N].timezone)
				[theFormatter setTimeZone:[NSTimeZone timeZoneWithName:thePairs[N].timezone]];
			
			[theFormatters addObject:theFormatter];
			}


		sFormatters = [theFormatters copy];
		}
	}
return(sFormatters);
}


+ (NSArray *)allInternetDateFormatters;
{
NSArray *sFormatters = NULL;

@synchronized(self)
	{
	if (sFormatters == NULL)
		{
		NSArray *theFormats = [NSArray arrayWithObjects:
			@"d MMM yy HH:mm:ss zzz",
			@"EEE, d MMM yy HH:mm:ss 'Z'",
			@"EEE, d MMM yy HH:mm:ss zzz",
			NULL];

		NSMutableArray *theFormatters = [NSMutableArray arrayWithCapacity:[theFormats count]];

		for (NSString *theFormat in theFormats)
			{
			NSDateFormatter *theFormatter = [[[NSDateFormatter alloc] init] autorelease];
			[theFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
			[theFormatter setDateFormat:theFormat];
			[theFormatters addObject:theFormatter];
			}

		sFormatters = [theFormatters copy];
		}
	}
return(sFormatters);
}

@end
