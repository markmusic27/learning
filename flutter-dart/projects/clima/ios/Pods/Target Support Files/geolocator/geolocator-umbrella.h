#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ErrorCodes.h"
#import "GeolocatorPlugin.h"
#import "GeolocationHandler.h"
#import "PermissionHandler.h"
#import "AuthorizationStatusMapper.h"
#import "LocationAccuracyMapper.h"
#import "LocationDistanceMapper.h"
#import "LocationMapper.h"

FOUNDATION_EXPORT double geolocatorVersionNumber;
FOUNDATION_EXPORT const unsigned char geolocatorVersionString[];

