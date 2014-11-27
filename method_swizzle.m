// Method Swizzle
// 
//
// IDECodeSnippetCompletionPrefix: swizzle
// IDECodeSnippetCompletionScopes: [TopLevel]
// IDECodeSnippetIdentifier: 0354C478-67FF-4EEF-9A9A-6827BB573577
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 0
#pragma mark - Metaprogramming

void MethodSwizzle(Class c, SEL orig, SEL new)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = c;
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        // ^ no probably don't use that. Because we don't have a reference to self.
        // If we want to swizzle class methods, reimplement this in a separate category.
        
        SEL originalSelector = orig;
        SEL swizzledSelector = new;
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}
