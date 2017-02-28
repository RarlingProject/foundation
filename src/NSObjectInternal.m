#import "NSObjectInternal.h"
#import <objc/runtime.h>

@implementation _NSWeakRef

- (id)init
{
    return [super init];
}

- (id)initWithObject:(id)object
{
    self = [super init];
    if (self)
    {
        self.object = object;
    }
    return self;
}

- (void)dealloc
{
    self.object = nil;
    [super dealloc];
}

- (void)setObject:(id)object
{
    objc_storeWeak(&_weakRef, object);
}

- (id)object
{
    return objc_loadWeak(&_weakRef);
}

@end

@implementation NSObject (_AbstractClasses)
- (void) subclassResponsibility: (SEL)aSelector
{
	_NSRequestConcreteImplementation([self class], aSelector);
}
@end

