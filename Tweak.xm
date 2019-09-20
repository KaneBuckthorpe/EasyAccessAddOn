
%hook UIStatusBarWindow
- (instancetype)initWithFrame: (CGRect)frame {
    self = %orig;

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleActivator)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tapRecognizer];

    return self;
}

%new
- (void)toggleActivator {
    CFNotificationCenterRef r = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(r, (CFStringRef)@"com.kaneb.easyaccess/showorhide", NULL, NULL, true);
}

%end
