//
//  Debug.h
//
//  Created by Steve Tranby on 2/14/10.
//  Copyright 2010 stevetranby. All rights reserved.
//

//#define DEBUG

#ifdef DEBUG
#define dlog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define dlog(...)
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
