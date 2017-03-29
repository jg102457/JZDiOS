
 Masonry是采用链式DSL(Domain-specific language)来封装NSLayoutConstraint，通过这种方式编写Auto Layout布局代码更加易读和简洁。


1、setNeedsUpdateConstraints

当一个自定义view的某个属性发生改变，并且可能影响到constraint时，需要调用此方法去标记constraints需要在未来的某个点更新，系统然后调用updateConstraints.

2、needsUpdateConstraints

constraint-based layout system使用此返回值去决定是否需要调用updateConstraints作为正常布局过程的一部分。

3、updateConstraintsIfNeeded

立即触发约束更新，自动更新布局。

4、updateConstraints

自定义view应该重写此方法在其中建立constraints. 注意：要在实现在最后调用[super updateConstraints]


5、setNeedsLayout

此方法会将view当前的layout设置为无效的，并在下一个upadte cycle里去触发layout更新。

6、layoutIfNeeded

使用此方法强制立即进行layout,从当前view开始，此方法会遍历整个view层次(包括superviews)请求layout。因此，调用此方法会强制整个view层次布局。

教程链接
http://www.cocoachina.com/ios/20141219/10702.html



