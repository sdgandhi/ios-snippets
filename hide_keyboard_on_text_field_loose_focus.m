// Hide keyboard on text field loose focus
// 
//
// IDECodeSnippetCompletionPrefix: closehidekeyboard
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: 85999AC6-06DD-45A1-9191-AE385B2410AA
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if ([<#textfield#> isFirstResponder] && [touch view] != <#textfield#>) {
        [<#textfield#> resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}