# GICXMLLayout

[![CI Status](https://img.shields.io/travis/ghwghw4/GICXMLLayout.svg?style=flat)](https://travis-ci.org/ghwghw4/GICXMLLayout)
[![Version](https://img.shields.io/cocoapods/v/GICXMLLayout.svg?style=flat)](https://cocoapods.org/pods/GICXMLLayout)
[![License](https://img.shields.io/cocoapods/l/GICXMLLayout.svg?style=flat)](https://cocoapods.org/pods/GICXMLLayout)
[![Platform](https://img.shields.io/cocoapods/p/GICXMLLayout.svg?style=flat)](https://cocoapods.org/pods/GICXMLLayout)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

# 介绍

`GICXMLLayout`以下简称`gic`，是一个以XML来描述UI的一个库，同时兼有MVVM的功能。`gic`能够做什么？

1. 以XML来描述UI、动画等。
2. 纯粹的MVVM
3. 支持`数据绑定`,类似h5中`Vue`提供的数据绑定能力
4. 支持`模板功能`类似于h5中的模板功能。
5. 强大的布局系统，甚至提供flex等复杂高效的布局
6. 强大的自定义能力，能够使得开发者按照自己的意愿扩展出能够直接使用XML来描述的任意功能。
7. 具有局部替换能力，可以对现有项目进行局部替换，使得局部功能具备MVVM+XML的能力。
8. 由于是直接采用XML来描述，因此天生具备实时更新的能力
9. `gic`的布局系统以及UI系统是基于`Texture`开发的，因此天生具有强大的性能优势

# 在线文档

[在线文档链接](http://gicxmllayout.gonghaiwei.cn/index.html)

## Installation

GICXMLLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GICXMLLayout'
```

## 更新日志

### 0.1.1

1. 新增样式(style)功能。

   > 您现在可以为您的UI元素添加样式了，您也可以将样式定义在单独的XML文件中，这样您可以为你的APP添加类似主题(theme)的功能了

### 0.2.0

1. 增加`canvas`元素,当前处于`beta`阶段，但已经可以使用。

   > 你现在可以直接使用`xml`来实现类似`Core Graphics`那样的功能了。你甚至可以直接使用`canvas`来实现一个报表，还支持动画哦。

2. 对`inpute`元素增加`keyboard-type `的支持

3. 增加`control`元素。

   > `control`的功能类似`UIControl`，提供`enable`、`highlight`、`selected`等状态管理。

4. 增加`data-context`元素。

   > 现在可以直接将一大段json 字符串作为数据源添加到`data-context`中了。

5. 增加`router`模块。



## Author

海伟, 693963124@qq.com

## License

GICXMLLayout is available under the MIT license. See the LICENSE file for more info.
