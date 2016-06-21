/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : spirit

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-20 17:51:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `T_ARTICLE`
-- ----------------------------
DROP TABLE IF EXISTS `T_ARTICLE`;
CREATE TABLE `T_ARTICLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) DEFAULT NULL,
  `THUMB` varchar(4000) DEFAULT NULL,
  `MD` text,
  `CONTENT` text,
  `CORPUS` varchar(10) DEFAULT NULL,
  `WORDS` int(10) DEFAULT NULL,
  `PV` int(10) DEFAULT NULL,
  `ISDELETE` int(1) DEFAULT '0' COMMENT '是否删除：1删除，0正常',
  `TIME` datetime DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of T_ARTICLE
-- ----------------------------
INSERT INTO `T_ARTICLE` VALUES ('1', 'Java中内存区域分配', '1', '运行时数据区通常包括这几个部分：\n- 程序计数器（Program Counter Register）\n- Java栈（VM Stack）\n- 本地方法栈（Native Method Stack）\n- 方法区（Method Area）\n- 堆（Heap）。\n\n###1、程序计数器\n程序计数器，也称作PC寄存器。想必学过汇编语言的朋友对程序计数器这个概念并不陌生，在汇编语言中，程序计数器是指CPU中的寄存器，他保存的是程序当前执行的指令的地址（也可以说保存下一条指令所在的存储单元的地址）。当CPU需要执行指令时，需要从程序计数器中得到当前需要执行的指令所在存储单元的地址。然后根据得到的地址获取指令。在得到指令之后，程序计数器便自动加1或者根据转移指令得到下一条指令的地址。如此循环，直到执行完所遇的指令。    \n虽然JVM中的程序计数器并不想汇编中的程序计数器一样是物理概念上的CPU寄存器，但是JVM中的程序计数器的功能跟汇编语言中的程序计数器的功能在逻辑上是相同。也就是用来指示执行哪条指令的。由于在JVM中，多线程是通过线程轮流切换来获得CPU执行时间的，因此，在任意时刻，一个CPU的内核只会执行一个线程中的指令。为了能够使每一个线程都在线程切换后恢复到切换之前的程序执行位置，每个线程都需要有自己独立的程序计数器，并且不能回想干扰，否则就会影响到程序的正常执行。因此，可以说程序计数器是每个线程私有的。\n在JVM规范中，如果线程执行的是费Native方法，则程序计数器中保存的是当前需要执行的指令的地址；如何执行的是Native方法，则程序计数器中的值是undefined。\n由于程序计数器中的存储的数据所占空间的大小不会随程序的执行而发生改变，因此，对于程序计数器是不会发生内存溢出现象的。\n###2、Java栈\n Java栈也称作虚拟机栈（Java Vitual Machine Stack）,也就是我们常常说的栈，跟C语言中的数据段汇中的栈类似。事实上，Java栈是Java方法执行的内存模型。Java栈中存放的是一个一个的栈帧，每个栈帧对应一个别调用的方法。在栈帧中包括局部变量表（Local Variable）、操作数栈（Operand Stack）、执行当前方法所属的类的运行时常量池的引用（Reference to runtime constant pool）、方法返回地址（Return Address）和一些额外的附加信息。当线程执行一个方法时，就会随之创建一个对应的栈帧，并将建立的栈帧压栈。当方法执行完之后，就会将栈帧出栈。线程当前执行方法对应的栈帧必定位于Java栈的顶部。这部分空间的分配和释放都是由系统自动完成的。对于所有的程序设计语言来说，栈这部分空间对程序员来说是不透明的。\n    局部变量表：用来存储方法中的局部变量（包括在方法中声明的非静态变量和函数形参）。对于基本类型的变量，则直接存储它的值，对于引用类型的变量，存储的是执行对象的引用。局部变量表的大小在编译器就可以确定其大小。因此在程序执行期间，局部变量表的大小是不会改变的。\n    操作数栈：程序中的所有计算过程都是借助操作数栈来完成的。\n    执行运行时常量池的引用：因为在方法执行的过程中有可能用到类中的常量，所以必须要有一个引用指向运行时常量。\n    方法反悔地址：当一个方法执行完毕之后，要反悔之前调用它的方法，因此在栈帧中必须要保存一个方法反悔地址。\n由于每个线程正在执行的方法可能不同，因此每一个线程都会有一个自己的Java栈，互不干扰。\n\n###3、本地方法栈\n本地方法栈和Java栈的作用和原理非常相似。区别只不过是Java栈是为执行Java方法服务的，而本地方法栈是为执行本地方法（Native Method）服务的。在JVM规范中，并没有对本地方法的具体实现方法和数据结构做强制规定，虚拟机可以自己实现他，在HotSpot虚拟机中直接就把本地方法栈和Java栈合二为一。\n\n###4、方法区\n方法区在JVM中也是一个非常重要的区域，它于堆一样，是被线程共享的区域。在方法区中，存储了每个类的信息（类的名称，方法信息，字段信息）、静态变量、常量以及编译器编译后的代码等。    \n在Class文件中除了类的字段、方法、接口等描述信息外，还有一项信息是常量池，用来存储编译期间生成的字面量和符号引用。     \n在方法区中有一个非常重要的部分就是运行时常量池，它是每一个类或接口的常量池的运行时表示形式，在类和接口被加载到JVM后，对应的运行时常量池就被创建出阿里。并非Class文件常量池中的内容才能进入运行时常量池，在运行期间也可将新的常量放入运行时常量池中。    \n在JVM规范中，没有强制要求方法去必须实现垃圾回收。很多人习惯将方法去称为：“永久代”，是因为在HotSpot虚拟机以永久代来实现方法去，从而JVM的垃圾收集器可以想管理堆区一样管理这部分区域，不需要为这部分专门设计垃圾回收机制。不过自从JDK7之后，HotSpot虚拟机便将运行时常量池从永久代移除了。\n\n###5、堆\n在C语言中，堆这部分空间是唯一一个程序员可以管理的内存区域。程序员可以通过malloc函数和free函数直接在堆上申请和释放空间。那么在Java中是怎么样的呢？    \nJava中堆是用来存储对象本身的以及数组（数组引用是存放在Java栈中的）。只不过和C语言中的不同，在Java中，程序员基本不用关心空间的释放问题，Java的垃圾回收机制会自动进行处理。因此这部分空间也是Java垃圾收集器管理的主要区域。堆是被所有线程共享的，在JVM中只有一个堆。\n\n\n', '<p>运行时数据区通常包括这几个部分：</p>\n<ul>\n<li>程序计数器（Program Counter Register）</li>\n<li>Java栈（VM Stack）</li>\n<li>本地方法栈（Native Method Stack）</li>\n<li>方法区（Method Area）</li>\n<li>堆（Heap）。</li>\n</ul>\n<h3 id=\"1-\">1、程序计数器</h3>\n<p>程序计数器，也称作PC寄存器。想必学过汇编语言的朋友对程序计数器这个概念并不陌生，在汇编语言中，程序计数器是指CPU中的寄存器，他保存的是程序当前执行的指令的地址（也可以说保存下一条指令所在的存储单元的地址）。当CPU需要执行指令时，需要从程序计数器中得到当前需要执行的指令所在存储单元的地址。然后根据得到的地址获取指令。在得到指令之后，程序计数器便自动加1或者根据转移指令得到下一条指令的地址。如此循环，直到执行完所遇的指令。<br>虽然JVM中的程序计数器并不想汇编中的程序计数器一样是物理概念上的CPU寄存器，但是JVM中的程序计数器的功能跟汇编语言中的程序计数器的功能在逻辑上是相同。也就是用来指示执行哪条指令的。由于在JVM中，多线程是通过线程轮流切换来获得CPU执行时间的，因此，在任意时刻，一个CPU的内核只会执行一个线程中的指令。为了能够使每一个线程都在线程切换后恢复到切换之前的程序执行位置，每个线程都需要有自己独立的程序计数器，并且不能回想干扰，否则就会影响到程序的正常执行。因此，可以说程序计数器是每个线程私有的。\n在JVM规范中，如果线程执行的是费Native方法，则程序计数器中保存的是当前需要执行的指令的地址；如何执行的是Native方法，则程序计数器中的值是undefined。\n由于程序计数器中的存储的数据所占空间的大小不会随程序的执行而发生改变，因此，对于程序计数器是不会发生内存溢出现象的。</p>\n<h3 id=\"2-java-\">2、Java栈</h3>\n<p> Java栈也称作虚拟机栈（Java Vitual Machine Stack）,也就是我们常常说的栈，跟C语言中的数据段汇中的栈类似。事实上，Java栈是Java方法执行的内存模型。Java栈中存放的是一个一个的栈帧，每个栈帧对应一个别调用的方法。在栈帧中包括局部变量表（Local Variable）、操作数栈（Operand Stack）、执行当前方法所属的类的运行时常量池的引用（Reference to runtime constant pool）、方法返回地址（Return Address）和一些额外的附加信息。当线程执行一个方法时，就会随之创建一个对应的栈帧，并将建立的栈帧压栈。当方法执行完之后，就会将栈帧出栈。线程当前执行方法对应的栈帧必定位于Java栈的顶部。这部分空间的分配和释放都是由系统自动完成的。对于所有的程序设计语言来说，栈这部分空间对程序员来说是不透明的。\n    局部变量表：用来存储方法中的局部变量（包括在方法中声明的非静态变量和函数形参）。对于基本类型的变量，则直接存储它的值，对于引用类型的变量，存储的是执行对象的引用。局部变量表的大小在编译器就可以确定其大小。因此在程序执行期间，局部变量表的大小是不会改变的。\n    操作数栈：程序中的所有计算过程都是借助操作数栈来完成的。\n    执行运行时常量池的引用：因为在方法执行的过程中有可能用到类中的常量，所以必须要有一个引用指向运行时常量。\n    方法反悔地址：当一个方法执行完毕之后，要反悔之前调用它的方法，因此在栈帧中必须要保存一个方法反悔地址。\n由于每个线程正在执行的方法可能不同，因此每一个线程都会有一个自己的Java栈，互不干扰。</p>\n<h3 id=\"3-\">3、本地方法栈</h3>\n<p>本地方法栈和Java栈的作用和原理非常相似。区别只不过是Java栈是为执行Java方法服务的，而本地方法栈是为执行本地方法（Native Method）服务的。在JVM规范中，并没有对本地方法的具体实现方法和数据结构做强制规定，虚拟机可以自己实现他，在HotSpot虚拟机中直接就把本地方法栈和Java栈合二为一。</p>\n<h3 id=\"4-\">4、方法区</h3>\n<p>方法区在JVM中也是一个非常重要的区域，它于堆一样，是被线程共享的区域。在方法区中，存储了每个类的信息（类的名称，方法信息，字段信息）、静态变量、常量以及编译器编译后的代码等。<br>在Class文件中除了类的字段、方法、接口等描述信息外，还有一项信息是常量池，用来存储编译期间生成的字面量和符号引用。<br>在方法区中有一个非常重要的部分就是运行时常量池，它是每一个类或接口的常量池的运行时表示形式，在类和接口被加载到JVM后，对应的运行时常量池就被创建出阿里。并非Class文件常量池中的内容才能进入运行时常量池，在运行期间也可将新的常量放入运行时常量池中。<br>在JVM规范中，没有强制要求方法去必须实现垃圾回收。很多人习惯将方法去称为：“永久代”，是因为在HotSpot虚拟机以永久代来实现方法去，从而JVM的垃圾收集器可以想管理堆区一样管理这部分区域，不需要为这部分专门设计垃圾回收机制。不过自从JDK7之后，HotSpot虚拟机便将运行时常量池从永久代移除了。</p>\n<h3 id=\"5-\">5、堆</h3>\n<p>在C语言中，堆这部分空间是唯一一个程序员可以管理的内存区域。程序员可以通过malloc函数和free函数直接在堆上申请和释放空间。那么在Java中是怎么样的呢？<br>Java中堆是用来存储对象本身的以及数组（数组引用是存放在Java栈中的）。只不过和C语言中的不同，在Java中，程序员基本不用关心空间的释放问题，Java的垃圾回收机制会自动进行处理。因此这部分空间也是Java垃圾收集器管理的主要区域。堆是被所有线程共享的，在JVM中只有一个堆。</p>\n', '1', '1711', '298', '0', '2016-05-20 13:56:10', null);
INSERT INTO `T_ARTICLE` VALUES ('2', '普通人如何找到自己的一技之长', '普通人如何找到自己的一技之长，并靠它赚到钱？', ' * 整理知识，学习笔记\n * 发布日记，杂文，所见所想\n * 撰写发布技术文稿（代码支持）\n * 撰写发布学术论文（LaTeX 公式支持）', '<ul>\n<li>整理知识，学习笔记</li>\n<li>发布日记，杂文，所见所想</li>\n<li>撰写发布技术文稿（代码支持）</li>\n<li>撰写发布学术论文（LaTeX 公式支持）</li>\n</ul>\n', '2', '42', '47', '0', '2016-05-19 14:11:52', null);
INSERT INTO `T_ARTICLE` VALUES ('3', '中文标题（2）', '中文标题（2）', '# 看看\n----\n> * 整理知识，学习笔记\n> * 发布日记，杂文，所见所想\n> * 撰写发布技术文稿（代码支持）\n> * 撰写发布学术论文（LaTeX 公式支持）\n\n![ user.JPG ](http://o7ex6y36h.bkt.clouddn.com/0a21faba-b852-4007-a9d9-ab27a5ac21ce.JPG)\n\n![ user.JPG ](http://o7ex6y36h.bkt.clouddn.com/4bd24e48-eff1-493c-9dc3-b89b5be3b2a1.JPG)\n\n![ user.JPG ](http://o7ex6y36h.bkt.clouddn.com/ef74f431-27e9-42e8-995c-4ff2c21d7c37.JPG)\n\n![ user.JPG ](http://o7ex6y36h.bkt.clouddn.com/f120002c-5ebe-489c-92f9-c67e72ce30f2.JPG)', '<h1 id=\"-\">看看</h1>\n<hr>\n<blockquote>\n<ul>\n<li>整理知识，学习笔记</li>\n<li>发布日记，杂文，所见所想</li>\n<li>撰写发布技术文稿（代码支持）</li>\n<li>撰写发布学术论文（LaTeX 公式支持）</li>\n</ul>\n</blockquote>\n<p><img src=\"http://o7ex6y36h.bkt.clouddn.com/0a21faba-b852-4007-a9d9-ab27a5ac21ce.JPG\" alt=\" user.JPG \"></p>\n<p><img src=\"http://o7ex6y36h.bkt.clouddn.com/4bd24e48-eff1-493c-9dc3-b89b5be3b2a1.JPG\" alt=\" user.JPG \"></p>\n<p><img src=\"http://o7ex6y36h.bkt.clouddn.com/ef74f431-27e9-42e8-995c-4ff2c21d7c37.JPG\" alt=\" user.JPG \"></p>\n<p><img src=\"http://o7ex6y36h.bkt.clouddn.com/f120002c-5ebe-489c-92f9-c67e72ce30f2.JPG\" alt=\" user.JPG \"></p>\n', '1', '44', '15', '0', '2016-05-19 11:07:18', '2016-05-20 17:37:15');
INSERT INTO `T_ARTICLE` VALUES ('4', '测试一下使用', '测试使用的', '# 欢迎使用 Cmd Markdown 编辑阅读器\n\n------\n\n我们理解您需要更便捷更高效的工具记录思想，整理笔记、知识，并将其中承载的价值传播给他人，**Cmd Markdown** 是我们给出的答案 —— 我们为记录思想和分享知识提供更专业的工具。 您可以使用 Cmd Markdown：\n\n> * 整理知识，学习笔记\n> * 发布日记，杂文，所见所想\n> * 撰写发布技术文稿（代码支持）\n> * 撰写发布学术论文（LaTeX 公式支持）\n\n![cmd-markdown-logo](https://www.zybuluo.com/static/img/logo.png)\n\n除了您现在看到的这个 Cmd Markdown 在线版本，您还可以前往以下网址下载：\n\n### [Windows/Mac/Linux 全平台客户端](https://www.zybuluo.com/cmd/)\n\n> 请保留此份 Cmd Markdown 的欢迎稿兼使用说明，如需撰写新稿件，点击顶部工具栏右侧的 <i class=\"icon-file\"></i> **新文稿** 或者使用快捷键 `Ctrl+Alt+N`。\n\n------\n\n## 什么是 Markdown\n\nMarkdown 是一种方便记忆、书写的纯文本标记语言，用户可以使用这些标记符号以最小的输入代价生成极富表现力的文档：譬如您正在阅读的这份文档。它使用简单的符号标记不同的标题，分割不同的段落，**粗体** 或者 *斜体* 某些文字，更棒的是，它还可以\n\n### 1. 制作一份待办事宜 [Todo 列表](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#13-待办事宜-todo-列表)\n\n- [ ] 支持以 PDF 格式导出文稿\n- [ ] 改进 Cmd 渲染算法，使用局部渲染技术提高渲染效率\n- [x] 新增 Todo 列表功能\n- [x] 修复 LaTex 公式渲染问题\n- [x] 新增 LaTex 公式编号功能\n\n### 2. 书写一个质能守恒公式[^LaTeX]\n\n$$E=mc^2$$\n\n### 3. 高亮一段代码[^code]\n\n```python\n@requires_authorization\nclass SomeClass:\n    pass\n\nif __name__ == \'__main__\':\n    # A comment\n    print \'hello world\'\n```\n\n### 4. 高效绘制 [流程图](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#7-流程图)\n\n```flow\nst=>start: Start\nop=>operation: Your Operation\ncond=>condition: Yes or No?\ne=>end\n\nst->op->cond\ncond(yes)->e\ncond(no)->op\n```\n\n### 5. 高效绘制 [序列图](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#8-序列图)\n\n```seq\nAlice->Bob: Hello Bob, how are you?\nNote right of Bob: Bob thinks\nBob-->Alice: I am good thanks!\n```\n\n### 6. 绘制表格\n\n| 项目        | 价格   |  数量  |\n| --------   | -----:  | :----:  |\n| 计算机     | \\$1600 |   5     |\n| 手机        |   \\$12   |   12   |\n| 管线        |    \\$1    |  234  |\n\n### 7. 更详细语法说明\n\n想要查看更详细的语法说明，可以参考我们准备的 [Cmd Markdown 简明语法手册][1]，进阶用户可以参考 [Cmd Markdown 高阶语法手册][2] 了解更多高级功能。\n\n总而言之，不同于其它 *所见即所得* 的编辑器：你只需使用键盘专注于书写文本内容，就可以生成印刷级的排版格式，省却在键盘和工具栏之间来回切换，调整内容和格式的麻烦。**Markdown 在流畅的书写和印刷级的阅读体验之间找到了平衡。** 目前它已经成为世界上最大的技术分享网站 GitHub 和 技术问答网站 StackOverFlow 的御用书写格式。\n\n---\n\n## 什么是 Cmd Markdown\n\n您可以使用很多工具书写 Markdown，但是 Cmd Markdown 是这个星球上我们已知的、最好的 Markdown 工具——没有之一 ：）因为深信文字的力量，所以我们和你一样，对流畅书写，分享思想和知识，以及阅读体验有极致的追求，我们把对于这些诉求的回应整合在 Cmd Markdown，并且一次，两次，三次，乃至无数次地提升这个工具的体验，最终将它演化成一个 **编辑/发布/阅读** Markdown 的在线平台——您可以在任何地方，任何系统/设备上管理这里的文字。\n\n### 1. 实时同步预览\n\n我们将 Cmd Markdown 的主界面一分为二，左边为**编辑区**，右边为**预览区**，在编辑区的操作会实时地渲染到预览区方便查看最终的版面效果，并且如果你在其中一个区拖动滚动条，我们有一个巧妙的算法把另一个区的滚动条同步到等价的位置，超酷！\n\n### 2. 编辑工具栏\n\n也许您还是一个 Markdown 语法的新手，在您完全熟悉它之前，我们在 **编辑区** 的顶部放置了一个如下图所示的工具栏，您可以使用鼠标在工具栏上调整格式，不过我们仍旧鼓励你使用键盘标记格式，提高书写的流畅度。\n\n![tool-editor](https://www.zybuluo.com/static/img/toolbar-editor.png)\n\n### 3. 编辑模式\n\n完全心无旁骛的方式编辑文字：点击 **编辑工具栏** 最右测的拉伸按钮或者按下 `Ctrl + M`，将 Cmd Markdown 切换到独立的编辑模式，这是一个极度简洁的写作环境，所有可能会引起分心的元素都已经被挪除，超清爽！\n\n### 4. 实时的云端文稿\n\n为了保障数据安全，Cmd Markdown 会将您每一次击键的内容保存至云端，同时在 **编辑工具栏** 的最右侧提示 `已保存` 的字样。无需担心浏览器崩溃，机器掉电或者地震，海啸——在编辑的过程中随时关闭浏览器或者机器，下一次回到 Cmd Markdown 的时候继续写作。\n\n### 5. 离线模式\n\n在网络环境不稳定的情况下记录文字一样很安全！在您写作的时候，如果电脑突然失去网络连接，Cmd Markdown 会智能切换至离线模式，将您后续键入的文字保存在本地，直到网络恢复再将他们传送至云端，即使在网络恢复前关闭浏览器或者电脑，一样没有问题，等到下次开启 Cmd Markdown 的时候，她会提醒您将离线保存的文字传送至云端。简而言之，我们尽最大的努力保障您文字的安全。\n\n### 6. 管理工具栏\n\n为了便于管理您的文稿，在 **预览区** 的顶部放置了如下所示的 **管理工具栏**：\n\n![tool-manager](https://www.zybuluo.com/static/img/toolbar-manager.jpg)\n\n通过管理工具栏可以：\n\n<i class=\"icon-share\"></i> 发布：将当前的文稿生成固定链接，在网络上发布，分享\n<i class=\"icon-file\"></i> 新建：开始撰写一篇新的文稿\n<i class=\"icon-trash\"></i> 删除：删除当前的文稿\n<i class=\"icon-cloud\"></i> 导出：将当前的文稿转化为 Markdown 文本或者 Html 格式，并导出到本地\n<i class=\"icon-reorder\"></i> 列表：所有新增和过往的文稿都可以在这里查看、操作\n<i class=\"icon-pencil\"></i> 模式：切换 普通/Vim/Emacs 编辑模式\n\n### 7. 阅读工具栏\n\n![tool-manager](https://www.zybuluo.com/static/img/toolbar-reader.jpg)\n\n通过 **预览区** 右上角的 **阅读工具栏**，可以查看当前文稿的目录并增强阅读体验。\n\n工具栏上的五个图标依次为：\n\n<i class=\"icon-list\"></i> 目录：快速导航当前文稿的目录结构以跳转到感兴趣的段落\n<i class=\"icon-chevron-sign-left\"></i> 视图：互换左边编辑区和右边预览区的位置\n<i class=\"icon-adjust\"></i> 主题：内置了黑白两种模式的主题，试试 **黑色主题**，超炫！\n<i class=\"icon-desktop\"></i> 阅读：心无旁骛的阅读模式提供超一流的阅读体验\n<i class=\"icon-fullscreen\"></i> 全屏：简洁，简洁，再简洁，一个完全沉浸式的写作和阅读环境\n\n### 8. 阅读模式\n\n在 **阅读工具栏** 点击 <i class=\"icon-desktop\"></i> 或者按下 `Ctrl+Alt+M` 随即进入独立的阅读模式界面，我们在版面渲染上的每一个细节：字体，字号，行间距，前背景色都倾注了大量的时间，努力提升阅读的体验和品质。\n\n### 9. 标签、分类和搜索\n\n在编辑区任意行首位置输入以下格式的文字可以标签当前文档：\n\n标签： 未分类\n\n标签以后的文稿在【文件列表】（Ctrl+Alt+F）里会按照标签分类，用户可以同时使用键盘或者鼠标浏览查看，或者在【文件列表】的搜索文本框内搜索标题关键字过滤文稿，如下图所示：\n\n![file-list](https://www.zybuluo.com/static/img/file-list.png)\n\n### 10. 文稿发布和分享\n\n在您使用 Cmd Markdown 记录，创作，整理，阅读文稿的同时，我们不仅希望它是一个有力的工具，更希望您的思想和知识通过这个平台，连同优质的阅读体验，将他们分享给有相同志趣的人，进而鼓励更多的人来到这里记录分享他们的思想和知识，尝试点击 <i class=\"icon-share\"></i> (Ctrl+Alt+P) 发布这份文档给好友吧！\n\n------\n\n再一次感谢您花费时间阅读这份欢迎稿，点击 <i class=\"icon-file\"></i> (Ctrl+Alt+N) 开始撰写新的文稿吧！祝您在这里记录、阅读、分享愉快！\n\n作者 [@ghosert][3]     \n2015 年 06月 15日    \n\n[^LaTeX]: 支持 **LaTeX** 编辑显示支持，例如：$\\sum_{i=1}^n a_i=0$， 访问 [MathJax][4] 参考更多使用方法。\n\n[^code]: 代码高亮功能支持包括 Java, Python, JavaScript 在内的，**四十一**种主流编程语言。\n\n[1]: https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown\n[2]: https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#cmd-markdown-高阶语法手册\n[3]: http://weibo.com/ghosert\n[4]: http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference\n', '<h1 id=\"-cmd-markdown-\">欢迎使用 Cmd Markdown 编辑阅读器</h1>\n<hr>\n<p>我们理解您需要更便捷更高效的工具记录思想，整理笔记、知识，并将其中承载的价值传播给他人，<strong>Cmd Markdown</strong> 是我们给出的答案 —— 我们为记录思想和分享知识提供更专业的工具。 您可以使用 Cmd Markdown：</p>\n<blockquote>\n<ul>\n<li>整理知识，学习笔记</li>\n<li>发布日记，杂文，所见所想</li>\n<li>撰写发布技术文稿（代码支持）</li>\n<li>撰写发布学术论文（LaTeX 公式支持）</li>\n</ul>\n</blockquote>\n<p><img src=\"https://www.zybuluo.com/static/img/logo.png\" alt=\"cmd-markdown-logo\"></p>\n<p>除了您现在看到的这个 Cmd Markdown 在线版本，您还可以前往以下网址下载：</p>\n<h3 id=\"-windows-mac-linux-https-www-zybuluo-com-cmd-\"><a href=\"https://www.zybuluo.com/cmd/\">Windows/Mac/Linux 全平台客户端</a></h3>\n<blockquote>\n<p>请保留此份 Cmd Markdown 的欢迎稿兼使用说明，如需撰写新稿件，点击顶部工具栏右侧的 <i class=\"icon-file\"></i> <strong>新文稿</strong> 或者使用快捷键 <code>Ctrl+Alt+N</code>。</p>\n</blockquote>\n<hr>\n<h2 id=\"-markdown\">什么是 Markdown</h2>\n<p>Markdown 是一种方便记忆、书写的纯文本标记语言，用户可以使用这些标记符号以最小的输入代价生成极富表现力的文档：譬如您正在阅读的这份文档。它使用简单的符号标记不同的标题，分割不同的段落，<strong>粗体</strong> 或者 <em>斜体</em> 某些文字，更棒的是，它还可以</p>\n<h3 id=\"1-todo-https-www-zybuluo-com-mdeditor-url-https-www-zybuluo-com-static-editor-md-help-markdown-13-todo-\">1. 制作一份待办事宜 <a href=\"https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#13-待办事宜-todo-列表\">Todo 列表</a></h3>\n<ul>\n<li>[ ] 支持以 PDF 格式导出文稿</li>\n<li>[ ] 改进 Cmd 渲染算法，使用局部渲染技术提高渲染效率</li>\n<li>[x] 新增 Todo 列表功能</li>\n<li>[x] 修复 LaTex 公式渲染问题</li>\n<li>[x] 新增 LaTex 公式编号功能</li>\n</ul>\n<h3 id=\"2-latex-\">2. 书写一个质能守恒公式[^LaTeX]</h3>\n<p>$$E=mc^2$$</p>\n<h3 id=\"3-code-\">3. 高亮一段代码[^code]</h3>\n<pre><code class=\"lang-python\">@requires_authorization\nclass SomeClass:\n    pass\n\nif __name__ == &#39;__main__&#39;:\n    # A comment\n    print &#39;hello world&#39;\n</code></pre>\n<h3 id=\"4-https-www-zybuluo-com-mdeditor-url-https-www-zybuluo-com-static-editor-md-help-markdown-7-\">4. 高效绘制 <a href=\"https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#7-流程图\">流程图</a></h3>\n<pre><code class=\"lang-flow\">st=&gt;start: Start\nop=&gt;operation: Your Operation\ncond=&gt;condition: Yes or No?\ne=&gt;end\n\nst-&gt;op-&gt;cond\ncond(yes)-&gt;e\ncond(no)-&gt;op\n</code></pre>\n<h3 id=\"5-https-www-zybuluo-com-mdeditor-url-https-www-zybuluo-com-static-editor-md-help-markdown-8-\">5. 高效绘制 <a href=\"https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#8-序列图\">序列图</a></h3>\n<pre><code class=\"lang-seq\">Alice-&gt;Bob: Hello Bob, how are you?\nNote right of Bob: Bob thinks\nBob--&gt;Alice: I am good thanks!\n</code></pre>\n<h3 id=\"6-\">6. 绘制表格</h3>\n<table class=\'table table-bordered\'>\n<thead>\n<tr>\n<th>项目</th>\n<th style=\"text-align:right\">价格</th>\n<th style=\"text-align:center\">数量</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>计算机</td>\n<td style=\"text-align:right\">\\$1600</td>\n<td style=\"text-align:center\">5</td>\n</tr>\n<tr>\n<td>手机</td>\n<td style=\"text-align:right\">\\$12</td>\n<td style=\"text-align:center\">12</td>\n</tr>\n<tr>\n<td>管线</td>\n<td style=\"text-align:right\">\\$1</td>\n<td style=\"text-align:center\">234</td>\n</tr>\n</tbody>\n</table>\n<h3 id=\"7-\">7. 更详细语法说明</h3>\n<p>想要查看更详细的语法说明，可以参考我们准备的 <a href=\"https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown\">Cmd Markdown 简明语法手册</a>，进阶用户可以参考 <a href=\"https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#cmd-markdown-高阶语法手册\">Cmd Markdown 高阶语法手册</a> 了解更多高级功能。</p>\n<p>总而言之，不同于其它 <em>所见即所得</em> 的编辑器：你只需使用键盘专注于书写文本内容，就可以生成印刷级的排版格式，省却在键盘和工具栏之间来回切换，调整内容和格式的麻烦。<strong>Markdown 在流畅的书写和印刷级的阅读体验之间找到了平衡。</strong> 目前它已经成为世界上最大的技术分享网站 GitHub 和 技术问答网站 StackOverFlow 的御用书写格式。</p>\n<hr>\n<h2 id=\"-cmd-markdown\">什么是 Cmd Markdown</h2>\n<p>您可以使用很多工具书写 Markdown，但是 Cmd Markdown 是这个星球上我们已知的、最好的 Markdown 工具——没有之一 ：）因为深信文字的力量，所以我们和你一样，对流畅书写，分享思想和知识，以及阅读体验有极致的追求，我们把对于这些诉求的回应整合在 Cmd Markdown，并且一次，两次，三次，乃至无数次地提升这个工具的体验，最终将它演化成一个 <strong>编辑/发布/阅读</strong> Markdown 的在线平台——您可以在任何地方，任何系统/设备上管理这里的文字。</p>\n<h3 id=\"1-\">1. 实时同步预览</h3>\n<p>我们将 Cmd Markdown 的主界面一分为二，左边为<strong>编辑区</strong>，右边为<strong>预览区</strong>，在编辑区的操作会实时地渲染到预览区方便查看最终的版面效果，并且如果你在其中一个区拖动滚动条，我们有一个巧妙的算法把另一个区的滚动条同步到等价的位置，超酷！</p>\n<h3 id=\"2-\">2. 编辑工具栏</h3>\n<p>也许您还是一个 Markdown 语法的新手，在您完全熟悉它之前，我们在 <strong>编辑区</strong> 的顶部放置了一个如下图所示的工具栏，您可以使用鼠标在工具栏上调整格式，不过我们仍旧鼓励你使用键盘标记格式，提高书写的流畅度。</p>\n<p><img src=\"https://www.zybuluo.com/static/img/toolbar-editor.png\" alt=\"tool-editor\"></p>\n<h3 id=\"3-\">3. 编辑模式</h3>\n<p>完全心无旁骛的方式编辑文字：点击 <strong>编辑工具栏</strong> 最右测的拉伸按钮或者按下 <code>Ctrl + M</code>，将 Cmd Markdown 切换到独立的编辑模式，这是一个极度简洁的写作环境，所有可能会引起分心的元素都已经被挪除，超清爽！</p>\n<h3 id=\"4-\">4. 实时的云端文稿</h3>\n<p>为了保障数据安全，Cmd Markdown 会将您每一次击键的内容保存至云端，同时在 <strong>编辑工具栏</strong> 的最右侧提示 <code>已保存</code> 的字样。无需担心浏览器崩溃，机器掉电或者地震，海啸——在编辑的过程中随时关闭浏览器或者机器，下一次回到 Cmd Markdown 的时候继续写作。</p>\n<h3 id=\"5-\">5. 离线模式</h3>\n<p>在网络环境不稳定的情况下记录文字一样很安全！在您写作的时候，如果电脑突然失去网络连接，Cmd Markdown 会智能切换至离线模式，将您后续键入的文字保存在本地，直到网络恢复再将他们传送至云端，即使在网络恢复前关闭浏览器或者电脑，一样没有问题，等到下次开启 Cmd Markdown 的时候，她会提醒您将离线保存的文字传送至云端。简而言之，我们尽最大的努力保障您文字的安全。</p>\n<h3 id=\"6-\">6. 管理工具栏</h3>\n<p>为了便于管理您的文稿，在 <strong>预览区</strong> 的顶部放置了如下所示的 <strong>管理工具栏</strong>：</p>\n<p><img src=\"https://www.zybuluo.com/static/img/toolbar-manager.jpg\" alt=\"tool-manager\"></p>\n<p>通过管理工具栏可以：</p>\n<p><i class=\"icon-share\"></i> 发布：将当前的文稿生成固定链接，在网络上发布，分享\n<i class=\"icon-file\"></i> 新建：开始撰写一篇新的文稿\n<i class=\"icon-trash\"></i> 删除：删除当前的文稿\n<i class=\"icon-cloud\"></i> 导出：将当前的文稿转化为 Markdown 文本或者 Html 格式，并导出到本地\n<i class=\"icon-reorder\"></i> 列表：所有新增和过往的文稿都可以在这里查看、操作\n<i class=\"icon-pencil\"></i> 模式：切换 普通/Vim/Emacs 编辑模式</p>\n<h3 id=\"7-\">7. 阅读工具栏</h3>\n<p><img src=\"https://www.zybuluo.com/static/img/toolbar-reader.jpg\" alt=\"tool-manager\"></p>\n<p>通过 <strong>预览区</strong> 右上角的 <strong>阅读工具栏</strong>，可以查看当前文稿的目录并增强阅读体验。</p>\n<p>工具栏上的五个图标依次为：</p>\n<p><i class=\"icon-list\"></i> 目录：快速导航当前文稿的目录结构以跳转到感兴趣的段落\n<i class=\"icon-chevron-sign-left\"></i> 视图：互换左边编辑区和右边预览区的位置\n<i class=\"icon-adjust\"></i> 主题：内置了黑白两种模式的主题，试试 <strong>黑色主题</strong>，超炫！\n<i class=\"icon-desktop\"></i> 阅读：心无旁骛的阅读模式提供超一流的阅读体验\n<i class=\"icon-fullscreen\"></i> 全屏：简洁，简洁，再简洁，一个完全沉浸式的写作和阅读环境</p>\n<h3 id=\"8-\">8. 阅读模式</h3>\n<p>在 <strong>阅读工具栏</strong> 点击 <i class=\"icon-desktop\"></i> 或者按下 <code>Ctrl+Alt+M</code> 随即进入独立的阅读模式界面，我们在版面渲染上的每一个细节：字体，字号，行间距，前背景色都倾注了大量的时间，努力提升阅读的体验和品质。</p>\n<h3 id=\"9-\">9. 标签、分类和搜索</h3>\n<p>在编辑区任意行首位置输入以下格式的文字可以标签当前文档：</p>\n<p>标签： 未分类</p>\n<p>标签以后的文稿在【文件列表】（Ctrl+Alt+F）里会按照标签分类，用户可以同时使用键盘或者鼠标浏览查看，或者在【文件列表】的搜索文本框内搜索标题关键字过滤文稿，如下图所示：</p>\n<p><img src=\"https://www.zybuluo.com/static/img/file-list.png\" alt=\"file-list\"></p>\n<h3 id=\"10-\">10. 文稿发布和分享</h3>\n<p>在您使用 Cmd Markdown 记录，创作，整理，阅读文稿的同时，我们不仅希望它是一个有力的工具，更希望您的思想和知识通过这个平台，连同优质的阅读体验，将他们分享给有相同志趣的人，进而鼓励更多的人来到这里记录分享他们的思想和知识，尝试点击 <i class=\"icon-share\"></i> (Ctrl+Alt+P) 发布这份文档给好友吧！</p>\n<hr>\n<p>再一次感谢您花费时间阅读这份欢迎稿，点击 <i class=\"icon-file\"></i> (Ctrl+Alt+N) 开始撰写新的文稿吧！祝您在这里记录、阅读、分享愉快！</p>\n<p>作者 <a href=\"http://weibo.com/ghosert\">@ghosert</a><br>2015 年 06月 15日    </p>\n<p>[^LaTeX]: 支持 <strong>LaTeX</strong> 编辑显示支持，例如：$\\sum_{i=1}^n a_i=0$， 访问 <a href=\"http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference\">MathJax</a> 参考更多使用方法。</p>\n<p>[^code]: 代码高亮功能支持包括 Java, Python, JavaScript 在内的，<strong>四十一</strong>种主流编程语言。</p>\n', '1', '1978', '31', '0', '2016-05-17 09:58:40', null);
INSERT INTO `T_ARTICLE` VALUES ('5', '测试', '测试使用的', '# 欢迎使用 Cmd Markdown 编辑阅读器\n\n------\n\n我们理解您需要更便捷更高效的工具记录思想，整理笔记、知识，并将其中承载的价值传播给他人，**Cmd Markdown** 是我们给出的答案 —— 我们为记录思想和分享知识提供更专业的工具。 您可以使用 Cmd Markdown：\n\n> * 整理知识，学习笔记\n> * 发布日记，杂文，所见所想\n> * 撰写发布技术文稿（代码支持）\n> * 撰写发布学术论文（LaTeX 公式支持）\n\n![cmd-markdown-logo](https://www.zybuluo.com/static/img/logo.png)\n\n除了您现在看到的这个 Cmd Markdown 在线版本，您还可以前往以下网址下载：\n\n### [Windows/Mac/Linux 全平台客户端](https://www.zybuluo.com/cmd/)\n\n> 请保留此份 Cmd Markdown 的欢迎稿兼使用说明，如需撰写新稿件，点击顶部工具栏右侧的 <i class=\"icon-file\"></i> **新文稿** 或者使用快捷键 `Ctrl+Alt+N`。\n\n------\n\n## 什么是 Markdown\n\nMarkdown 是一种方便记忆、书写的纯文本标记语言，用户可以使用这些标记符号以最小的输入代价生成极富表现力的文档：譬如您正在阅读的这份文档。它使用简单的符号标记不同的标题，分割不同的段落，**粗体** 或者 *斜体* 某些文字，更棒的是，它还可以\n\n### 1. 制作一份待办事宜 [Todo 列表](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#13-待办事宜-todo-列表)\n\n- [ ] 支持以 PDF 格式导出文稿\n- [ ] 改进 Cmd 渲染算法，使用局部渲染技术提高渲染效率\n- [x] 新增 Todo 列表功能\n- [x] 修复 LaTex 公式渲染问题\n- [x] 新增 LaTex 公式编号功能\n\n### 2. 书写一个质能守恒公式[^LaTeX]\n\n$$E=mc^2$$\n\n### 3. 高亮一段代码[^code]\n\n```python\n@requires_authorization\nclass SomeClass:\n    pass\n\nif __name__ == \'__main__\':\n    # A comment\n    print \'hello world\'\n```\n\n### 4. 高效绘制 [流程图](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#7-流程图)\n\n```flow\nst=>start: Start\nop=>operation: Your Operation\ncond=>condition: Yes or No?\ne=>end\n\nst->op->cond\ncond(yes)->e\ncond(no)->op\n```\n\n### 5. 高效绘制 [序列图](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#8-序列图)\n\n```seq\nAlice->Bob: Hello Bob, how are you?\nNote right of Bob: Bob thinks\nBob-->Alice: I am good thanks!\n```\n\n### 6. 绘制表格\n\n| 项目        | 价格   |  数量  |\n| --------   | -----:  | :----:  |\n| 计算机     | \\$1600 |   5     |\n| 手机        |   \\$12   |   12   |\n| 管线        |    \\$1    |  234  |\n\n### 7. 更详细语法说明\n\n想要查看更详细的语法说明，可以参考我们准备的 [Cmd Markdown 简明语法手册][1]，进阶用户可以参考 [Cmd Markdown 高阶语法手册][2] 了解更多高级功能。\n\n总而言之，不同于其它 *所见即所得* 的编辑器：你只需使用键盘专注于书写文本内容，就可以生成印刷级的排版格式，省却在键盘和工具栏之间来回切换，调整内容和格式的麻烦。**Markdown 在流畅的书写和印刷级的阅读体验之间找到了平衡。** 目前它已经成为世界上最大的技术分享网站 GitHub 和 技术问答网站 StackOverFlow 的御用书写格式。\n\n---\n\n## 什么是 Cmd Markdown\n\n您可以使用很多工具书写 Markdown，但是 Cmd Markdown 是这个星球上我们已知的、最好的 Markdown 工具——没有之一 ：）因为深信文字的力量，所以我们和你一样，对流畅书写，分享思想和知识，以及阅读体验有极致的追求，我们把对于这些诉求的回应整合在 Cmd Markdown，并且一次，两次，三次，乃至无数次地提升这个工具的体验，最终将它演化成一个 **编辑/发布/阅读** Markdown 的在线平台——您可以在任何地方，任何系统/设备上管理这里的文字。\n\n### 1. 实时同步预览\n\n我们将 Cmd Markdown 的主界面一分为二，左边为**编辑区**，右边为**预览区**，在编辑区的操作会实时地渲染到预览区方便查看最终的版面效果，并且如果你在其中一个区拖动滚动条，我们有一个巧妙的算法把另一个区的滚动条同步到等价的位置，超酷！\n\n### 2. 编辑工具栏\n\n也许您还是一个 Markdown 语法的新手，在您完全熟悉它之前，我们在 **编辑区** 的顶部放置了一个如下图所示的工具栏，您可以使用鼠标在工具栏上调整格式，不过我们仍旧鼓励你使用键盘标记格式，提高书写的流畅度。\n\n![tool-editor](https://www.zybuluo.com/static/img/toolbar-editor.png)\n\n### 3. 编辑模式\n\n完全心无旁骛的方式编辑文字：点击 **编辑工具栏** 最右测的拉伸按钮或者按下 `Ctrl + M`，将 Cmd Markdown 切换到独立的编辑模式，这是一个极度简洁的写作环境，所有可能会引起分心的元素都已经被挪除，超清爽！\n\n### 4. 实时的云端文稿\n\n为了保障数据安全，Cmd Markdown 会将您每一次击键的内容保存至云端，同时在 **编辑工具栏** 的最右侧提示 `已保存` 的字样。无需担心浏览器崩溃，机器掉电或者地震，海啸——在编辑的过程中随时关闭浏览器或者机器，下一次回到 Cmd Markdown 的时候继续写作。\n\n### 5. 离线模式\n\n在网络环境不稳定的情况下记录文字一样很安全！在您写作的时候，如果电脑突然失去网络连接，Cmd Markdown 会智能切换至离线模式，将您后续键入的文字保存在本地，直到网络恢复再将他们传送至云端，即使在网络恢复前关闭浏览器或者电脑，一样没有问题，等到下次开启 Cmd Markdown 的时候，她会提醒您将离线保存的文字传送至云端。简而言之，我们尽最大的努力保障您文字的安全。\n\n### 6. 管理工具栏\n\n为了便于管理您的文稿，在 **预览区** 的顶部放置了如下所示的 **管理工具栏**：\n\n![tool-manager](https://www.zybuluo.com/static/img/toolbar-manager.jpg)\n\n通过管理工具栏可以：\n\n<i class=\"icon-share\"></i> 发布：将当前的文稿生成固定链接，在网络上发布，分享\n<i class=\"icon-file\"></i> 新建：开始撰写一篇新的文稿\n<i class=\"icon-trash\"></i> 删除：删除当前的文稿\n<i class=\"icon-cloud\"></i> 导出：将当前的文稿转化为 Markdown 文本或者 Html 格式，并导出到本地\n<i class=\"icon-reorder\"></i> 列表：所有新增和过往的文稿都可以在这里查看、操作\n<i class=\"icon-pencil\"></i> 模式：切换 普通/Vim/Emacs 编辑模式\n\n### 7. 阅读工具栏\n\n![tool-manager](https://www.zybuluo.com/static/img/toolbar-reader.jpg)\n\n通过 **预览区** 右上角的 **阅读工具栏**，可以查看当前文稿的目录并增强阅读体验。\n\n工具栏上的五个图标依次为：\n\n<i class=\"icon-list\"></i> 目录：快速导航当前文稿的目录结构以跳转到感兴趣的段落\n<i class=\"icon-chevron-sign-left\"></i> 视图：互换左边编辑区和右边预览区的位置\n<i class=\"icon-adjust\"></i> 主题：内置了黑白两种模式的主题，试试 **黑色主题**，超炫！\n<i class=\"icon-desktop\"></i> 阅读：心无旁骛的阅读模式提供超一流的阅读体验\n<i class=\"icon-fullscreen\"></i> 全屏：简洁，简洁，再简洁，一个完全沉浸式的写作和阅读环境\n\n### 8. 阅读模式\n\n在 **阅读工具栏** 点击 <i class=\"icon-desktop\"></i> 或者按下 `Ctrl+Alt+M` 随即进入独立的阅读模式界面，我们在版面渲染上的每一个细节：字体，字号，行间距，前背景色都倾注了大量的时间，努力提升阅读的体验和品质。\n\n### 9. 标签、分类和搜索\n\n在编辑区任意行首位置输入以下格式的文字可以标签当前文档：\n\n标签： 未分类\n\n标签以后的文稿在【文件列表】（Ctrl+Alt+F）里会按照标签分类，用户可以同时使用键盘或者鼠标浏览查看，或者在【文件列表】的搜索文本框内搜索标题关键字过滤文稿，如下图所示：\n\n![file-list](https://www.zybuluo.com/static/img/file-list.png)\n\n### 10. 文稿发布和分享\n\n在您使用 Cmd Markdown 记录，创作，整理，阅读文稿的同时，我们不仅希望它是一个有力的工具，更希望您的思想和知识通过这个平台，连同优质的阅读体验，将他们分享给有相同志趣的人，进而鼓励更多的人来到这里记录分享他们的思想和知识，尝试点击 <i class=\"icon-share\"></i> (Ctrl+Alt+P) 发布这份文档给好友吧！\n\n------\n\n再一次感谢您花费时间阅读这份欢迎稿，点击 <i class=\"icon-file\"></i> (Ctrl+Alt+N) 开始撰写新的文稿吧！祝您在这里记录、阅读、分享愉快！\n\n作者 [@ghosert][3]     \n2015 年 06月 15日    \n\n[^LaTeX]: 支持 **LaTeX** 编辑显示支持，例如：$\\sum_{i=1}^n a_i=0$， 访问 [MathJax][4] 参考更多使用方法。\n\n[^code]: 代码高亮功能支持包括 Java, Python, JavaScript 在内的，**四十一**种主流编程语言。\n\n[1]: https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown\n[2]: https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#cmd-markdown-高阶语法手册\n[3]: http://weibo.com/ghosert\n[4]: http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference\n', '<h1 id=\"-cmd-markdown-\">欢迎使用 Cmd Markdown 编辑阅读器</h1>\n<hr>\n<p>我们理解您需要更便捷更高效的工具记录思想，整理笔记、知识，并将其中承载的价值传播给他人，<strong>Cmd Markdown</strong> 是我们给出的答案 —— 我们为记录思想和分享知识提供更专业的工具。 您可以使用 Cmd Markdown：</p>\n<blockquote>\n<ul>\n<li>整理知识，学习笔记</li>\n<li>发布日记，杂文，所见所想</li>\n<li>撰写发布技术文稿（代码支持）</li>\n<li>撰写发布学术论文（LaTeX 公式支持）</li>\n</ul>\n</blockquote>\n<p><img src=\"https://www.zybuluo.com/static/img/logo.png\" alt=\"cmd-markdown-logo\"></p>\n<p>除了您现在看到的这个 Cmd Markdown 在线版本，您还可以前往以下网址下载：</p>\n<h3 id=\"-windows-mac-linux-https-www-zybuluo-com-cmd-\"><a href=\"https://www.zybuluo.com/cmd/\">Windows/Mac/Linux 全平台客户端</a></h3>\n<blockquote>\n<p>请保留此份 Cmd Markdown 的欢迎稿兼使用说明，如需撰写新稿件，点击顶部工具栏右侧的 <i class=\"icon-file\"></i> <strong>新文稿</strong> 或者使用快捷键 <code>Ctrl+Alt+N</code>。</p>\n</blockquote>\n<hr>\n<h2 id=\"-markdown\">什么是 Markdown</h2>\n<p>Markdown 是一种方便记忆、书写的纯文本标记语言，用户可以使用这些标记符号以最小的输入代价生成极富表现力的文档：譬如您正在阅读的这份文档。它使用简单的符号标记不同的标题，分割不同的段落，<strong>粗体</strong> 或者 <em>斜体</em> 某些文字，更棒的是，它还可以</p>\n<h3 id=\"1-todo-https-www-zybuluo-com-mdeditor-url-https-www-zybuluo-com-static-editor-md-help-markdown-13-todo-\">1. 制作一份待办事宜 <a href=\"https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#13-待办事宜-todo-列表\">Todo 列表</a></h3>\n<ul>\n<li>[ ] 支持以 PDF 格式导出文稿</li>\n<li>[ ] 改进 Cmd 渲染算法，使用局部渲染技术提高渲染效率</li>\n<li>[x] 新增 Todo 列表功能</li>\n<li>[x] 修复 LaTex 公式渲染问题</li>\n<li>[x] 新增 LaTex 公式编号功能</li>\n</ul>\n<h3 id=\"2-latex-\">2. 书写一个质能守恒公式[^LaTeX]</h3>\n<p>$$E=mc^2$$</p>\n<h3 id=\"3-code-\">3. 高亮一段代码[^code]</h3>\n<pre><code class=\"lang-python\">@requires_authorization\nclass SomeClass:\n    pass\n\nif __name__ == &#39;__main__&#39;:\n    # A comment\n    print &#39;hello world&#39;\n</code></pre>\n<h3 id=\"4-https-www-zybuluo-com-mdeditor-url-https-www-zybuluo-com-static-editor-md-help-markdown-7-\">4. 高效绘制 <a href=\"https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#7-流程图\">流程图</a></h3>\n<pre><code class=\"lang-flow\">st=&gt;start: Start\nop=&gt;operation: Your Operation\ncond=&gt;condition: Yes or No?\ne=&gt;end\n\nst-&gt;op-&gt;cond\ncond(yes)-&gt;e\ncond(no)-&gt;op\n</code></pre>\n<h3 id=\"5-https-www-zybuluo-com-mdeditor-url-https-www-zybuluo-com-static-editor-md-help-markdown-8-\">5. 高效绘制 <a href=\"https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#8-序列图\">序列图</a></h3>\n<pre><code class=\"lang-seq\">Alice-&gt;Bob: Hello Bob, how are you?\nNote right of Bob: Bob thinks\nBob--&gt;Alice: I am good thanks!\n</code></pre>\n<h3 id=\"6-\">6. 绘制表格</h3>\n<table class=\'table table-bordered\'>\n<thead>\n<tr>\n<th>项目</th>\n<th style=\"text-align:right\">价格</th>\n<th style=\"text-align:center\">数量</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>计算机</td>\n<td style=\"text-align:right\">\\$1600</td>\n<td style=\"text-align:center\">5</td>\n</tr>\n<tr>\n<td>手机</td>\n<td style=\"text-align:right\">\\$12</td>\n<td style=\"text-align:center\">12</td>\n</tr>\n<tr>\n<td>管线</td>\n<td style=\"text-align:right\">\\$1</td>\n<td style=\"text-align:center\">234</td>\n</tr>\n</tbody>\n</table>\n<h3 id=\"7-\">7. 更详细语法说明</h3>\n<p>想要查看更详细的语法说明，可以参考我们准备的 <a href=\"https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown\">Cmd Markdown 简明语法手册</a>，进阶用户可以参考 <a href=\"https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#cmd-markdown-高阶语法手册\">Cmd Markdown 高阶语法手册</a> 了解更多高级功能。</p>\n<p>总而言之，不同于其它 <em>所见即所得</em> 的编辑器：你只需使用键盘专注于书写文本内容，就可以生成印刷级的排版格式，省却在键盘和工具栏之间来回切换，调整内容和格式的麻烦。<strong>Markdown 在流畅的书写和印刷级的阅读体验之间找到了平衡。</strong> 目前它已经成为世界上最大的技术分享网站 GitHub 和 技术问答网站 StackOverFlow 的御用书写格式。</p>\n<hr>\n<h2 id=\"-cmd-markdown\">什么是 Cmd Markdown</h2>\n<p>您可以使用很多工具书写 Markdown，但是 Cmd Markdown 是这个星球上我们已知的、最好的 Markdown 工具——没有之一 ：）因为深信文字的力量，所以我们和你一样，对流畅书写，分享思想和知识，以及阅读体验有极致的追求，我们把对于这些诉求的回应整合在 Cmd Markdown，并且一次，两次，三次，乃至无数次地提升这个工具的体验，最终将它演化成一个 <strong>编辑/发布/阅读</strong> Markdown 的在线平台——您可以在任何地方，任何系统/设备上管理这里的文字。</p>\n<h3 id=\"1-\">1. 实时同步预览</h3>\n<p>我们将 Cmd Markdown 的主界面一分为二，左边为<strong>编辑区</strong>，右边为<strong>预览区</strong>，在编辑区的操作会实时地渲染到预览区方便查看最终的版面效果，并且如果你在其中一个区拖动滚动条，我们有一个巧妙的算法把另一个区的滚动条同步到等价的位置，超酷！</p>\n<h3 id=\"2-\">2. 编辑工具栏</h3>\n<p>也许您还是一个 Markdown 语法的新手，在您完全熟悉它之前，我们在 <strong>编辑区</strong> 的顶部放置了一个如下图所示的工具栏，您可以使用鼠标在工具栏上调整格式，不过我们仍旧鼓励你使用键盘标记格式，提高书写的流畅度。</p>\n<p><img src=\"https://www.zybuluo.com/static/img/toolbar-editor.png\" alt=\"tool-editor\"></p>\n<h3 id=\"3-\">3. 编辑模式</h3>\n<p>完全心无旁骛的方式编辑文字：点击 <strong>编辑工具栏</strong> 最右测的拉伸按钮或者按下 <code>Ctrl + M</code>，将 Cmd Markdown 切换到独立的编辑模式，这是一个极度简洁的写作环境，所有可能会引起分心的元素都已经被挪除，超清爽！</p>\n<h3 id=\"4-\">4. 实时的云端文稿</h3>\n<p>为了保障数据安全，Cmd Markdown 会将您每一次击键的内容保存至云端，同时在 <strong>编辑工具栏</strong> 的最右侧提示 <code>已保存</code> 的字样。无需担心浏览器崩溃，机器掉电或者地震，海啸——在编辑的过程中随时关闭浏览器或者机器，下一次回到 Cmd Markdown 的时候继续写作。</p>\n<h3 id=\"5-\">5. 离线模式</h3>\n<p>在网络环境不稳定的情况下记录文字一样很安全！在您写作的时候，如果电脑突然失去网络连接，Cmd Markdown 会智能切换至离线模式，将您后续键入的文字保存在本地，直到网络恢复再将他们传送至云端，即使在网络恢复前关闭浏览器或者电脑，一样没有问题，等到下次开启 Cmd Markdown 的时候，她会提醒您将离线保存的文字传送至云端。简而言之，我们尽最大的努力保障您文字的安全。</p>\n<h3 id=\"6-\">6. 管理工具栏</h3>\n<p>为了便于管理您的文稿，在 <strong>预览区</strong> 的顶部放置了如下所示的 <strong>管理工具栏</strong>：</p>\n<p><img src=\"https://www.zybuluo.com/static/img/toolbar-manager.jpg\" alt=\"tool-manager\"></p>\n<p>通过管理工具栏可以：</p>\n<p><i class=\"icon-share\"></i> 发布：将当前的文稿生成固定链接，在网络上发布，分享\n<i class=\"icon-file\"></i> 新建：开始撰写一篇新的文稿\n<i class=\"icon-trash\"></i> 删除：删除当前的文稿\n<i class=\"icon-cloud\"></i> 导出：将当前的文稿转化为 Markdown 文本或者 Html 格式，并导出到本地\n<i class=\"icon-reorder\"></i> 列表：所有新增和过往的文稿都可以在这里查看、操作\n<i class=\"icon-pencil\"></i> 模式：切换 普通/Vim/Emacs 编辑模式</p>\n<h3 id=\"7-\">7. 阅读工具栏</h3>\n<p><img src=\"https://www.zybuluo.com/static/img/toolbar-reader.jpg\" alt=\"tool-manager\"></p>\n<p>通过 <strong>预览区</strong> 右上角的 <strong>阅读工具栏</strong>，可以查看当前文稿的目录并增强阅读体验。</p>\n<p>工具栏上的五个图标依次为：</p>\n<p><i class=\"icon-list\"></i> 目录：快速导航当前文稿的目录结构以跳转到感兴趣的段落\n<i class=\"icon-chevron-sign-left\"></i> 视图：互换左边编辑区和右边预览区的位置\n<i class=\"icon-adjust\"></i> 主题：内置了黑白两种模式的主题，试试 <strong>黑色主题</strong>，超炫！\n<i class=\"icon-desktop\"></i> 阅读：心无旁骛的阅读模式提供超一流的阅读体验\n<i class=\"icon-fullscreen\"></i> 全屏：简洁，简洁，再简洁，一个完全沉浸式的写作和阅读环境</p>\n<h3 id=\"8-\">8. 阅读模式</h3>\n<p>在 <strong>阅读工具栏</strong> 点击 <i class=\"icon-desktop\"></i> 或者按下 <code>Ctrl+Alt+M</code> 随即进入独立的阅读模式界面，我们在版面渲染上的每一个细节：字体，字号，行间距，前背景色都倾注了大量的时间，努力提升阅读的体验和品质。</p>\n<h3 id=\"9-\">9. 标签、分类和搜索</h3>\n<p>在编辑区任意行首位置输入以下格式的文字可以标签当前文档：</p>\n<p>标签： 未分类</p>\n<p>标签以后的文稿在【文件列表】（Ctrl+Alt+F）里会按照标签分类，用户可以同时使用键盘或者鼠标浏览查看，或者在【文件列表】的搜索文本框内搜索标题关键字过滤文稿，如下图所示：</p>\n<p><img src=\"https://www.zybuluo.com/static/img/file-list.png\" alt=\"file-list\"></p>\n<h3 id=\"10-\">10. 文稿发布和分享</h3>\n<p>在您使用 Cmd Markdown 记录，创作，整理，阅读文稿的同时，我们不仅希望它是一个有力的工具，更希望您的思想和知识通过这个平台，连同优质的阅读体验，将他们分享给有相同志趣的人，进而鼓励更多的人来到这里记录分享他们的思想和知识，尝试点击 <i class=\"icon-share\"></i> (Ctrl+Alt+P) 发布这份文档给好友吧！</p>\n<hr>\n<p>再一次感谢您花费时间阅读这份欢迎稿，点击 <i class=\"icon-file\"></i> (Ctrl+Alt+N) 开始撰写新的文稿吧！祝您在这里记录、阅读、分享愉快！</p>\n<p>作者 <a href=\"http://weibo.com/ghosert\">@ghosert</a><br>2015 年 06月 15日    </p>\n<p>[^LaTeX]: 支持 <strong>LaTeX</strong> 编辑显示支持，例如：$\\sum_{i=1}^n a_i=0$， 访问 <a href=\"http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference\">MathJax</a> 参考更多使用方法。</p>\n<p>[^code]: 代码高亮功能支持包括 Java, Python, JavaScript 在内的，<strong>四十一</strong>种主流编程语言。</p>\n', '3', '1978', '7', '0', '2016-05-17 13:09:55', null);
INSERT INTO `T_ARTICLE` VALUES ('6', '中文标题（一）', '中文标题（一）', '比如小六选择阅读和手绘来作为自己第二职业的“一技之长”，因为首先我从小就喜欢画画，但是高考的时候被家长逼迫放弃了而已，我也从小就喜欢读书；其次，我小时候的作文和手绘得到过老师的认可，外人认可我的天赋；三是我有时间，我可以利用周六周日的时间去做这方面的学习，参加类似的培训。\n\n秋叶大叔32岁之前都还不知道自己会靠PPT来挣钱；\n小六知道去年9月才知道自己可以写文章变成小网红；\n我还是上个月才知道我可以靠教别人涂鸦画画挣钱的。\n\n所以选择什么技能来做为自己兼职挣钱的能力并不重要。\n重要的就看这三个方面：时间，天赋，能力的交集都有那些技能可以挑选。\n\n文／彭小六（简书签约作者）\n原文链接：http://www.jianshu.com/p/a233e5d10c80\n著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。', '<p>比如小六选择阅读和手绘来作为自己第二职业的“一技之长”，因为首先我从小就喜欢画画，但是高考的时候被家长逼迫放弃了而已，我也从小就喜欢读书；其次，我小时候的作文和手绘得到过老师的认可，外人认可我的天赋；三是我有时间，我可以利用周六周日的时间去做这方面的学习，参加类似的培训。</p>\n<p>秋叶大叔32岁之前都还不知道自己会靠PPT来挣钱；\n小六知道去年9月才知道自己可以写文章变成小网红；\n我还是上个月才知道我可以靠教别人涂鸦画画挣钱的。</p>\n<p>所以选择什么技能来做为自己兼职挣钱的能力并不重要。\n重要的就看这三个方面：时间，天赋，能力的交集都有那些技能可以挑选。</p>\n<p>文／彭小六（简书签约作者）\n原文链接：<a href=\"http://www.jianshu.com/p/a233e5d10c80\">http://www.jianshu.com/p/a233e5d10c80</a>\n著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p>\n', '1', '283', '15', '0', '2016-05-19 11:06:48', null);

-- ----------------------------
-- Table structure for `T_COMMENT`
-- ----------------------------
DROP TABLE IF EXISTS `T_COMMENT`;
CREATE TABLE `T_COMMENT` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `ARTICLE_ID` int(10) DEFAULT NULL,
  `TIME` datetime DEFAULT NULL,
  `COMMENT` varchar(1000) DEFAULT NULL,
  `ADDRESS` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of T_COMMENT
-- ----------------------------
INSERT INTO `T_COMMENT` VALUES ('1', 'kk', '1', '2016-05-20 14:29:18', '文章写的不错，但是有好多东西还是需要学习啊', '南京市');
INSERT INTO `T_COMMENT` VALUES ('2', '黄腾', '1', '2016-05-20 16:23:14', '需yaoasdfasdfddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666d', '南京市');
INSERT INTO `T_COMMENT` VALUES ('5', 'ht', '1', '2016-05-20 17:49:51', 'ht', 'ht');

-- ----------------------------
-- Table structure for `T_COMMENT`
-- ----------------------------
DROP TABLE IF EXISTS `T_COMMENT`;
CREATE TABLE `T_COMMENT` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `ISDELETE` int(1) DEFAULT '0' COMMENT '是否删除：1删除，0正常',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of T_COMMENT
-- ----------------------------
INSERT INTO `T_COMMENT` VALUES ('1', '第一个', '0');
INSERT INTO `T_COMMENT` VALUES ('2', '第二个', '0');
INSERT INTO `T_COMMENT` VALUES ('3', '测试', '0');

-- ----------------------------
-- Table structure for `T_DAILYREPORT`
-- ----------------------------
DROP TABLE IF EXISTS `T_DAILYREPORT`;
CREATE TABLE `T_DAILYREPORT` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '自动递增ID',
  `DAILYDATE` datetime DEFAULT NULL COMMENT '时间',
  `PROJECTNAME` varchar(100) DEFAULT NULL COMMENT '工作项目',
  `CONTENT` varchar(100) DEFAULT NULL COMMENT '工作内容及成果',
  `DAILYCATEGORY` int(1) DEFAULT NULL COMMENT '工作性质，0：临时 1：例行',
  `DAILYTIME` int(2) DEFAULT NULL COMMENT '工作时长',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of T_DAILYREPORT
-- ----------------------------
INSERT INTO `T_DAILYREPORT` VALUES ('1', '2016-04-07 09:55:18', ' 日报系统', '设计日报表结构', '0', '8');
INSERT INTO `T_DAILYREPORT` VALUES ('2', '2016-04-08 00:00:00', 'test', 'test', '0', '8');
INSERT INTO `T_DAILYREPORT` VALUES ('3', '2016-04-08 00:00:00', 'test2', 'dddddddddd', '0', '2');
INSERT INTO `T_DAILYREPORT` VALUES ('4', '2016-04-08 00:00:00', 'test3', 'ddddddddddddddd', '1', '1');
INSERT INTO `T_DAILYREPORT` VALUES ('5', '2016-04-08 00:00:00', 'test4', 'happy!111111111111111', '0', '2');

-- ----------------------------
-- Table structure for `T_DEMO`
-- ----------------------------
DROP TABLE IF EXISTS `T_DEMO`;
CREATE TABLE `T_DEMO` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of T_DEMO
-- ----------------------------
INSERT INTO `T_DEMO` VALUES ('1', 'tom');
INSERT INTO `T_DEMO` VALUES ('2', 'jerry');
INSERT INTO `T_DEMO` VALUES ('3', 'shawn');

-- ----------------------------
-- Table structure for `T_MENU`
-- ----------------------------
DROP TABLE IF EXISTS `T_MENU`;
CREATE TABLE `T_MENU` (
  `ID` int(22) NOT NULL AUTO_INCREMENT COMMENT '模块自增长id',
  `NAME` varchar(150) DEFAULT NULL COMMENT '模块标题',
  `PARENT_ID` varchar(255) DEFAULT NULL COMMENT '模块编码',
  `URL` varchar(255) DEFAULT NULL COMMENT '模块连接地址',
  `PERMISSION` varchar(20) DEFAULT NULL COMMENT '模块关联的关联员id',
  `ICON` int(11) DEFAULT NULL COMMENT '模块的排序',
  `POSITION` int(1) DEFAULT NULL COMMENT '模块是否是菜单',
  `ISSHOW` varchar(120) DEFAULT NULL COMMENT '模块图标',
  `ISDEL` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of T_MENU
-- ----------------------------
INSERT INTO `T_MENU` VALUES ('1', '内容管理', '0', '', null, null, null, '', null);
INSERT INTO `T_MENU` VALUES ('2', '新增内容', '1', '/manager/article/add.do', 'daily:add', null, null, null, null);
INSERT INTO `T_MENU` VALUES ('3', '内容列表', '1', 'daily/addDaily.do', null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('4', '分类管理', '0', null, null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('5', '新增分类', '4', 'addDaily.do', null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('6', '分类列表', '4', 'addDaily.do', null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('7', '菜单管理', '0', null, null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('8', '新增菜单', '7', 'addDaily.do', null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('9', '菜单列表', '7', 'addDaily.do', null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('10', '日志管理', '0', null, null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('11', '查询日志', '10', '/druid/sql.html', null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('12', '系统管理', '0', null, null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('13', '用户管理', '12', '/manager/user/init.do', null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('14', '角色管理', '12', '/manager/role/init.do', null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('15', '菜单管理', '12', '/manager/menu/init.do', null, null, null, null, null);
INSERT INTO `T_MENU` VALUES ('133', '12344', '12', '123', '12', null, null, null, null);
INSERT INTO `T_MENU` VALUES ('134', '6', '12', '7', '8', null, null, null, null);

-- ----------------------------
-- Table structure for `T_MENU_role`
-- ----------------------------
DROP TABLE IF EXISTS `T_MENU_role`;
CREATE TABLE `T_MENU_role` (
  `MENU_ID` int(20) NOT NULL,
  `ROLE_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of T_MENU_role
-- ----------------------------
INSERT INTO `T_MENU_role` VALUES ('1', '3');
INSERT INTO `T_MENU_role` VALUES ('2', '3');
INSERT INTO `T_MENU_role` VALUES ('3', '3');
INSERT INTO `T_MENU_role` VALUES ('4', '3');
INSERT INTO `T_MENU_role` VALUES ('5', '3');
INSERT INTO `T_MENU_role` VALUES ('6', '3');
INSERT INTO `T_MENU_role` VALUES ('12', '3');
INSERT INTO `T_MENU_role` VALUES ('14', '3');
INSERT INTO `T_MENU_role` VALUES ('1', '2');
INSERT INTO `T_MENU_role` VALUES ('2', '2');
INSERT INTO `T_MENU_role` VALUES ('3', '2');
INSERT INTO `T_MENU_role` VALUES ('4', '2');
INSERT INTO `T_MENU_role` VALUES ('5', '2');
INSERT INTO `T_MENU_role` VALUES ('6', '2');
INSERT INTO `T_MENU_role` VALUES ('12', '2');
INSERT INTO `T_MENU_role` VALUES ('14', '2');
INSERT INTO `T_MENU_role` VALUES ('15', '2');
INSERT INTO `T_MENU_role` VALUES ('133', '2');
INSERT INTO `T_MENU_role` VALUES ('1', '1');
INSERT INTO `T_MENU_role` VALUES ('2', '1');
INSERT INTO `T_MENU_role` VALUES ('3', '1');
INSERT INTO `T_MENU_role` VALUES ('4', '1');
INSERT INTO `T_MENU_role` VALUES ('5', '1');
INSERT INTO `T_MENU_role` VALUES ('6', '1');
INSERT INTO `T_MENU_role` VALUES ('7', '1');
INSERT INTO `T_MENU_role` VALUES ('8', '1');
INSERT INTO `T_MENU_role` VALUES ('9', '1');
INSERT INTO `T_MENU_role` VALUES ('10', '1');
INSERT INTO `T_MENU_role` VALUES ('11', '1');
INSERT INTO `T_MENU_role` VALUES ('12', '1');
INSERT INTO `T_MENU_role` VALUES ('13', '1');
INSERT INTO `T_MENU_role` VALUES ('14', '1');
INSERT INTO `T_MENU_role` VALUES ('15', '1');
INSERT INTO `T_MENU_role` VALUES ('133', '1');
INSERT INTO `T_MENU_role` VALUES ('134', '1');

-- ----------------------------
-- Table structure for `T_ROLE`
-- ----------------------------
DROP TABLE IF EXISTS `T_ROLE`;
CREATE TABLE `T_ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) DEFAULT NULL,
  `REMARK` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of T_ROLE
-- ----------------------------
INSERT INTO `T_ROLE` VALUES ('1', 'admin', '管理员');
INSERT INTO `T_ROLE` VALUES ('2', 'ht', 'ht');
INSERT INTO `T_ROLE` VALUES ('3', 'test', 'test');

-- ----------------------------
-- Table structure for `T_USER`
-- ----------------------------
DROP TABLE IF EXISTS `T_USER`;
CREATE TABLE `T_USER` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(30) DEFAULT NULL,
  `REALNAME` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `NUMBER` varchar(10) DEFAULT NULL,
  `SEX` varchar(1) DEFAULT NULL,
  `PHONE` varchar(11) DEFAULT NULL,
  `QQ` varchar(15) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of T_USER
-- ----------------------------
INSERT INTO `T_USER` VALUES ('1', 'admin', 'dfd', '123456', 'admin', '16', '1', '123456', '89562', '1');
INSERT INTO `T_USER` VALUES ('2', '中国', 'f', '3', '4', '18', '0', '123456', '855656', '1');
INSERT INTO `T_USER` VALUES ('3', '3', 'f', '3', '3', '3', '3', '3', '3', '2');
INSERT INTO `T_USER` VALUES ('4', '4', 'ff', 'f', '4', '4', '0', '4', '4', '1');
INSERT INTO `T_USER` VALUES ('5', 'admin@163.com', 'f', '123456', 'kk', 'kk', '0', 'kk', 'kk', '6');
INSERT INTO `T_USER` VALUES ('22', 'test', 'f', 'f', 'test', 'test', '1', 'test', 'test', '7');
INSERT INTO `T_USER` VALUES ('23', '功夫', 'f', 'f', 'sdf', 'sdf', '0', 'sdf', 'sdf', '8');

-- ----------------------------
-- Table structure for `T_USER_ROLE`
-- ----------------------------
DROP TABLE IF EXISTS `T_USER_ROLE`;
CREATE TABLE `T_USER_ROLE` (
  `USER_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of T_USER_ROLE
-- ----------------------------
INSERT INTO `T_USER_ROLE` VALUES ('1', '1');
INSERT INTO `T_USER_ROLE` VALUES ('4', '2');
INSERT INTO `T_USER_ROLE` VALUES ('5', '1');
INSERT INTO `T_USER_ROLE` VALUES ('22', '2');
INSERT INTO `T_USER_ROLE` VALUES ('23', '1');
