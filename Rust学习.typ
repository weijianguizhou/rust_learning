#import "@preview/latexy-book:0.0.4": book, frontmatter, mainmatter, appendix, backmatter, definition, theorem, example, notice, code

// 常用元素：definition / theorem / example / notice / code
// 交叉引用：@ch:ownership
// 图片：#figure(image("fig.png", width: 80%), caption: [说明]) <fig:name>

#show: book.with(
  title: "Rust 学习",
  subtitle: "学习笔记",
  author: "爱吃烧饼的大熊猫",
  date: datetime.today().display("[year] 年 [month] 月"),
  titlepage: true,
)

#set text(lang: "zh")

// ---------------------------------------------------------
//                     前置部分
// ---------------------------------------------------------
#frontmatter()

= 前言

耍耍。使用的环境是wsl-Ubuntu26.04.

#outline()



// ---------------------------------------------------------
//                     正文
// ---------------------------------------------------------
#mainmatter()

= 第一部分 基础篇 <part:basic>
== 安装 Rust并运行第一个程序
=== 在Ubuntu中安装rust
在终端敲入
```bash
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```
可能会比较慢，这时候配置国内镜像：
```bash
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
```
然后再执行即可。

为了确保配置生效，安装成功后在终端执行指令：
```bash
. "$HOME/.cargo/env"
```
然后验证：
```bash
rustc --version
cargo --version
```

=== 尝试运行第一个rust程序
创建一个新文件`hello.rs`,输入以下内容：
```rust
fn main(){
 println!("Hello,Rust!")
}
```
保存，在终端中运行
```bash
rustc hello.rs
./hello
```
就可以看到输出。

可以看出，我们的Rust是一种*预编译静态类型*语言 。也就是说，我们先编译程序生成可执行文件，然后执行可执行文件。我们可以把可执行文件发给别人，别人就算没有安装Rust也可以顺利运行。

=== Hello，Cargo！！！
就像C++里有CMake这样的包管理器一样，Rust也有自己的构建系统和包管理器———Cargo。Cargo使用体验比CMake好一点，至于怎么好，个人视角，具体鞋子舒不舒服还得穿在自己脚上。
==== 用Cargo创建项目
在项目文件夹里创建一个新项目
```zsh
cargo new hello_cargo
cd hello_cargo
```
查看目录结构为：
```
.
├── Cargo.toml
└── src
    └── main.rs

2 directories, 2 files
```
显然，这个命令会创建一个名为`hello_cargo`的新目录和项目。同时创建了一些文件。打开查看一下这些文件。

==== 用Cargo构建项目
在项目目录里输入
```zsh
cargo build
```
即可启动构建，然后查看结构变成
```
.
├── Cargo.lock
├── Cargo.toml
├── src
│   └── main.rs
└── target
    ├── CACHEDIR.TAG
    └── debug
        ├── build
        │   └── hello_cargo
        │       └── 16be976bc65d1826
        │           ├── fingerprint
        │           │   ├── bin-hello_cargo
        │           │   ├── bin-hello_cargo.json
        │           │   ├── dep-bin-hello_cargo
        │           │   ├── invoked.timestamp
        │           │   └── output-bin-hello_cargo
        │           └── out
        │               ├── hello_cargo
        │               └── hello_cargo.d
        ├── examples
        ├── hello_cargo
        ├── hello_cargo.d
        └── incremental
            └── hello_cargo-0pbvc1t2m5bts
                ├── s-hoecky4sv5-1k41xiz-3iwwuyji72eb7aqqcnd3hcu9j
                │   ├── 3o785mkhyp2ba09u5zgdun42j.o
                │   ├── 5atj7vrv6m7d7b551yj994973.o
                │   ├── 5n074oo1khmqgs5ejlsdfbi0z.o
                │   ├── 8po6qqf9iyjndqztzzpu6asv7.o
                │   ├── c4dm0uwqndgvl5x8s5gcezxp8.o
                │   ├── dep-graph.bin
                │   ├── dguszz03ofxqwef1hi62so5ph.o
                │   ├── query-cache.bin
                │   └── work-products.bin
                └── s-hoecky4sv5-1k41xiz.lock

13 directories, 23 files
```
比较复杂。也可以使用下面这个命令来直接编译运行代码
```zsh
cargo run
```
显然，这个命令更方便。

Cargo还提供了一个`cargo check`命令，该命令快速检查你的代码以确保它能编译但不生成可执行文件
// ---------------------------------------------------------
//                     附录
// ---------------------------------------------------------
#appendix()

= 附录 A 常用命令速查

== Cargo 命令
- `cargo new <项目名称>`：创建一个新项目
- `cargo build` 编译项目
- `cargo run` 编译运行项目
- `cargo check`快速检查你的代码以确保它能编译但不生成可执行文件



// ---------------------------------------------------------
//                     后置部分
// ---------------------------------------------------------
#backmatter()

= 后记
