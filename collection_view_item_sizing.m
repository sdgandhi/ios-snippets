// Collection View Item Sizing
// 
//
// IDECodeSnippetCompletionPrefix: collectionviewitemsizing
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: 06C6EC97-8A10-40AD-8CFC-EAA21689C02B
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 0
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)<#collectionView#>.collectionViewLayout;
    
    CGFloat itemWidth = size.width - layout.sectionInset.left - layout.sectionInset.right;
    CGFloat itemHeight = layout.itemSize.height;
    
    [layout setItemSize:CGSizeMake(itemWidth, itemHeight)];
    [layout invalidateLayout];
}