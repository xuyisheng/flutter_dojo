# Flutter Dojo

[![license](https://img.shields.io/badge/License-GPL-yellow.svg)](https://opensource.org/licenses/gpl-license)  ![Flutter dojo Release apk](https://github.com/xuyisheng/flutter_dojo/workflows/Flutter%20dojo%20Release%20apk/badge.svg)

## Change log

[Flutter Dojo Change Log](https://github.com/xuyisheng/flutter_dojo/blob/master/CHANGELOG.md)

## Wiki

[Flutter Dojo Wiki](https://github.com/xuyisheng/flutter_dojo/wiki)

## 体验APK

[Github Actions APK download](https://github.com/xuyisheng/flutter_dojo/releases)

认识Flutter是在18年，移动端开发日趋成熟的情况下，很多开发者都在寻求跨平台开发的终极法门，在经过了webview、RN的痛苦之后，Flutter的出现，给跨平台开发带来了一线曙光。自此，便开始了Flutter的学习之路，布道师之路，修仙之路。

## 筑基

Flutter的学习曲线很奇怪，像坐过山车一样，初学很简单，上手几天，很快就能写一些基本的界面，但是很快就遇到了瓶颈，因为官方的Widget越来越多，越来越复杂，学了忘，忘了学，有些人突破了，成为了一代先驱，有些人则被搞的一团雾水，大骂一声，垃圾Flutter，毁我青春。

相信大部分上手的开发者，都会抱怨两个问题，一是Widget太多，二是嵌套太多。嵌套太多的问题，没什么好解释的，大部分有这种抱怨的人，都是因为不知道如何正确的使用茫茫多的Widget而恼羞成怒的。

对于UI界面来说，树形结构是表现UI最好的方式，当然可以通过很多其它的方式来减少嵌套，但simple is fast，Android xml布局中，嵌套近十层的布局比比皆是，这对于写UI来说，并不会造成什么困扰。

但是Widget太多，确实是一个比较麻烦的问题，这里的学习什么考验开发者的学习能力，Flutter虽然在设计Widget方面略显随意，但是官方所给出的Widget，几乎都是比较实用的，覆盖了开发的方方面面，只用常用的那些Widget，确实也可以完成大部分UI的开发，但是，掌握更多的官方Widget，会让你的开发更加方便。

我在学习的过程中，自然也遇到了这些问题，经过一年多的沉淀，逐渐对整个架构有了一些认识，所以也萌生了一些想法，想通过一个Flutter App，来帮助初学者、进阶者快速掌握Flutter，这才有了Flutter Dojo的雏形。

Dojo，源自日语「道場」。我希望的是通过Flutter Dojo让初学者快速掌握官方Widget的常用使用方法，让进阶者掌握Flutter开发组件、封装组件的基本思路，让学有小成者更加高效、更加快速的进行Flutter开发。

所以，我在最开始的时候，将Flutter Dojo分为了下面几个部分：

- Widgets
- UI Pattern
- Animations
- Back-end Util

Flutter Dojo的设计主要围绕下面三个部分展开：

- 良好的演示效果
- 简单明了的代码
- 好看的界面设计

整个项目的代码都以上面几点作为目标，代码力图简洁，不使用复杂的架构设计和抽象，每一部分的演示代码几乎都可以单独使用，同时尽可能的美化UI。

### Widgets

Widgets部分的设计思路是为了演示Flutter中茫茫多的Widget的具体使用场景和功能，虽然只使用Flutter提供的一些基本Widget，已经可以实现大部分的界面、功能开发，但是，了解更多的Widget，可以让开发者的开发思路更广，使用更加合适的Widget来完成合适的开发场景。

经过迭代，Widgets部分已经完善了官方的所有Widget，以及官方在Category中未列举但是有很大实用价值的Widget。

### UI Pattern

UI Pattern部分的设计思路是为了帮助开发者了解如何使用Flutter来拆分大部分APP中的界面模板，通过Flutter实现一个个UI组件，来组合成完整的Flutter界面。

通过UI Pattern的学习，可以让开发者了解Flutter的具体解题思路，如何拆分UI的实现套路。

### Animations

Animations部分的设计思路是为了让开发者对Flutter的动画有一个完整的认识，针对不同的场景使用不同的动画方案，同时，对大部分常见的动画场景进行梳理，完成动画场景的归类。

### Back-end Util

Back-end Util这部分主要是针对Flutter中的非UI场景知识点进行的梳理，包括数据持久化、解析、状态管理等等。

最初的这一版，在GitHub的私有仓库迭代了将近一年，才终于基本定型Release出来。

![](https://user-gold-cdn.xitu.io/2020/7/25/17383cd09ef0c5a1?w=1756&h=216&f=png&s=26566)

## 出窍

有了具体的设计思路后，我就开始构思如何来实现了，Flutter Dojo，首先是一个Demo，即演示类的App，所以，它一定是重在代码，但却可以通过Demo的分解，将功能演示出来，其次，虽然说是Demo，但绝不是一个粗制滥造的UI，长得好看，才叫Flutter Dojo，长的丑，只能叫Flutter Demo。所以，最后的设计风格调整了好几次，最终定稿如下。

<p align="center">
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383d6655c0e3a5" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383d7463fc23a2" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383da406b44d80" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383daac0cce400" width="150"/>
</p>

这四个部分，是Flutter Dojo的核心功能，分别对应了上面提到的四个部分。

### Widgets

Widgets部分的设计完全按照官方的Flutter Widget Category来进行分类。

<p align="center">
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383df33a52ca7b" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383df7a0c6fc74" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383e0179847616" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383dec1e0ca080" width="150"/>
</p>

一级分类和二级分类，分类整理了官方的所有Widget和简介。

当然，核心是每个Widget的使用场景的展示。

<p align="center">
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383e435b984189" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383e47690e2304" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383e4bd681740b" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383e5243b50eab" width="150"/>
</p>

这里只展示了几个Widget的演示界面，更多的Widget，请自行使用。

### UI Pattern

UI Pattern的分类，我是按照组件的功能进行划分的。

<p align="center">
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383e7dc396c8f1" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383e813b814e7c" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383e85ed0b5edc" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383e8a39ba4cfd" width="150"/>
</p>

### Animations

Animations的分类同样是根据动画构建类型来进行分类的。

<p align="center">
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383eb021205014" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383eb1741e7fd5" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383eb2e7684c8d" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383eb593fe43e0" width="150"/>
</p>

### Back-end Util

Flutter虽然说是一个UI跨平台框架，但是其征途依然是星辰大海，所以即使是非UI的东西，Flutter依然会包含，所以，这部分就展示的是各种非UI的Flutter开发技术点。

<p align="center">
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383ede7ae90252" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383edfa3c835fb" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383ee110e13e2a" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383ee23f7926df" width="150"/>
</p>

有了这四部分的加持，Flutter Dojo的核心功能就算是完备了，当然，这里面的分类和Demo依然在不停的更新中，所以，Flutter Dojo只会越来越完善，不过万变不离其宗，其设计思想依然是围绕着这四个方面展开的。

至此，Flutter Dojo 1.0 发布。

## 分神

在设计完这四个核心的方向之后，我开始自己使用Flutter Dojo来巩固Flutter的学习，在使用过程中，逐渐发现了一些不足，比如在使用App的时候，不能查看代码，虽然场景设计的是通过界面来掌握Flutter Widget的学习，但是，并不是所有的场景都能完美的让你学到这个Widget的使用精髓，所以，在App端查看代码是一个刚需，在学习场景的时候，遇到不懂的地方，可以直接通过查看代码来了解具体的使用原理。

其次，Flutter Dojo的代码设计为copy anywhere的，Demo中的代码，几乎全部是可以完全复制使用的，这也是为了初学者考虑，整个代码不包含复用、继承等架构设计，开发者通过单个的Demo示例就可以完全掌握，而不是要先了解其它基类、抽象的实现等等，所以要实现代码的轻松copy功能。

另外，由于Widget和Pattern分类越来越多，查看起来经常会忘记分类的具体位置，所以，搜索功能也是亟需添加的。

因此，在Flutter Dojo 1.0的基础之上，2.0版本新增了搜索、查看源代码以及分享功能。

<p align="center">
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383fced5961e76" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383fd0172434f5" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383fd165271d71" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17383fe5e3f5f153" width="150"/>
</p>

搜索功能非常强大，支持模糊匹配、前后缀匹配，效率高、速度快。

查看源代码功能，使用Markdown解析源代码，可以直接在App中查看代码。

分享功能可直接将源代码分享出去，实现copy anywhere。

至此，Flutter Dojo 2.0 发布。

## 合体

Flutter Dojo经过两个版本的迭代，不仅仅在功能上更加完善了，分类和Demo的拆解也更加优秀了，所以，在Flutter Dojo 3.0上，我增加了一些信息流的设计，让开发者在学习这些现有知识的基础上，能够更加好的接触到一些更新的Flutter文章，所以，这里我设计了一个Feed功能，将掘金上的Flutter Tag下的文章聚合到Flutter Dojo中。

<p align="center">
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/173844c76db7fa70" width="150"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/173844c89d52f06f" width="150"/>
</p>

至此，Flutter Dojo 3.0 发布。

## 渡劫

本篇是Flutter Dojo解析文章的总纲，后面会有一系列文章来进行分析Flutter Dojo中那些不为人知的秘密。

详情请参考Wiki [Flutter Dojo Wiki](https://github.com/xuyisheng/flutter_dojo/wiki)

## 飞升

Flutter Dojo具体该怎么使用呢？首先，大家可以在GitHub下载最新的Flutter Dojo Apk

[Github Actions APK download](https://github.com/xuyisheng/flutter_dojo/releases)

或者在【百度应用市场】【小米应用市场】搜索【Flutter dojo】下载最新的Apk文件安装。

先熟悉整体结构，在空闲时间，对感兴趣的Demo进行学习，遇到难点，可以通过App内置的查看代码功能查看具体代码，或者通过分析功能将代码copy出来分析。

当你觉得整体差不多后，可以将整个工程clone下来，针对代码和工程做进一步的学习。

## 修仙

Flutter Dojo开源至今，受到了很多Flutter学习者和爱好者的喜爱，也有越来越多的人加入到Flutter的学习中来，所以我建了个Flutter修仙群，但是人数太多，所以分成了【Flutter修仙指南】【Flutter修仙指北】两个群，对Flutter感兴趣的朋友，可以添加我的微信，注明加入Flutter修仙群。

<p align="center">
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/173845eee975fa26" width="300"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/17384621ec0f5c96" width="300"/>
</p>

当然，开源不易，国际惯例。

<p align="center">
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/1738463a9fbd479f" width="300"/>
  <img src="https://user-gold-cdn.xitu.io/2020/7/25/1738463bd42440a5" width="300"/>
</p>

## 编译环境

```
Flutter 1.17.5 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 8af6b2f038 (4 weeks ago) • 2020-06-30 12:53:55 -0700
Engine • revision ee76268252
Tools • Dart 2.8.4
```

Flutter Dojo 3.0 在GitHub Action CI编译通过。
