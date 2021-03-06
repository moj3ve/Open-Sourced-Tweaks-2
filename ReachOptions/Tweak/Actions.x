// ReachOptions
// Copyright (c) ajaidan0

#import "Actions-Structs.h"

@implementation ReachOptions

// Control Center action
+(void)ControlCenter {
    [[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
}

// Lock action
+(void)Lock {
    [(SpringBoard *)[UIApplication sharedApplication] _simulateLockButtonPress];
}

// Respring
+(void)Respring {
    pid_t pid;
	const char* args[] = {"killall", "-9", "SpringBoard", NULL, NULL};
	posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}

// Screenshot
+(void)Screenshot {
    [(SpringBoard *)[UIApplication sharedApplication] takeScreenshot];
}

// Spotlight
+(void)Spotlight {
    [(AXSpringBoardServer *)[%c(AXSpringBoardServer) server] revealSpotlight];
}

// UICache
+(void)UICache {
    pid_t pid;
	const char* args[] = {"uicache", NULL, NULL};
	posix_spawn(&pid, "/usr/bin/uicache", NULL, NULL, (char* const*)args, NULL);
}

// WiFi
+(void)WiFi {
    BOOL wiFiEnabled = [[%c(SBWiFiManager) sharedInstance] wiFiEnabled];
    [[%c(SBWiFiManager) sharedInstance] setWiFiEnabled:!wiFiEnabled];
}

@end
