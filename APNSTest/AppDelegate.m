//
//  AppDelegate.m
//  APNSTest
//
//  Created by Seema Patil on 2/6/15.
//  Copyright (c) 2015 Seema Patil. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    
    
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
#ifdef __IPHONE_8_0
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge
                                                                                             |UIUserNotificationTypeSound
                                                                                             |UIUserNotificationTypeAlert) categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
#endif
    } else {
        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
        [application registerForRemoteNotificationTypes:myTypes];
    }
    
    
    
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



#pragma mark - Notification

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    
    NSString *deviceTokenString = [NSString stringWithFormat:@"%@",devToken];
    
    deviceTokenString = [deviceTokenString stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    deviceTokenString = [deviceTokenString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"device:%@",deviceTokenString);
//    
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSDictionary *regiCredentials = [NSDictionary dictionaryWithObjectsAndKeys:deviceTokenString,@"deviceToken", nil];
//    [userDefaults setObject:regiCredentials forKey:@"Register"];
//    [userDefaults synchronize];
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"device in fail:%@",[err description]);

//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSDictionary *regiCredentials = [NSDictionary dictionaryWithObjectsAndKeys:@"",@"deviceToken", nil];
//    [userDefaults removeObjectForKey:@"Register"];
//    [userDefaults setObject:regiCredentials forKey:@"Register"];
//    [userDefaults synchronize];
}

#pragma mark - Notification Handling
-(void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo{
    NSLog(@"userInfo:%@",[userInfo description]);
    
    [[[UIAlertView alloc] initWithTitle:@"Notification" message:[NSString stringWithFormat:@"%@",[userInfo description]] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    //{"aps":{"alert":"My first push notification!","sound":"default/Users/patil_s/Seema/Demo/APNSTest/APNSTest/AppDelegate.m","badge":4}}
}
@end
