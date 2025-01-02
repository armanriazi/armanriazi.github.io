Rust Learning Plan & Chapter 1 Notes
Last updated: 03/06/2020

Hello and welcome! This might be the first time we meet so I thought I’d start this post off with a short introduction.

I’m Joe and previously I worked with JavaScript building web apps and mobile apps. Now, I’m learning Rust both for personal reasons and work-related reasons. One of my primary focuses for this half of the year is Rust!

Beyond that though, I am personally excited about Rust because:

it’s exciting
it’s type-safe (Yay, coming from TypeScript!)
it’s performant
it has excellent documentation
it has a strong community
I dabbled a bit about a year ago doing some exercises on exercism but now learning Rust is a high priority.

You might be interested in Rust because you can build: CLI tools Web apps (compile to WASM, or Web Assembly) Web servers And many other exciting things!

For March, I decided to put together a plan to learn a little bit of Rust. The purpose is to start building projects with Rust and get involved in the community.

Here’s what the plan looks like:

Learn enough Rust to be dangerous, measured by:

ability to understand and explain basic concepts in Rust
ability to contribute code to an open source project in the Rust community
ability to build and ship a small project in Rust
I’ve taken these objectives and broken them out into actionable tasks. They are as follows:

Read Chapters 1-3 of the Rust Lang Book (by Steve Klabnik and Carol Nichols, with contributions from the Rust Community)
Write 3 blog posts
Contribute to an open source project (bug fix or docs)
Build a small web server app (bunny1 clone)
This is the first blog post in the series, which covers my notes and thoughts on Chapter 1 of the Rust Lang Book. If you read Chapter 1 and would like to discuss, let’s have a conversation! Tweet @ me or shoot me a DM on Twitter.

Notes on Chapter 1
The first chapter in the Rust Lang Book is a friendly introduction to Rust. It covers enough of the basics to get started. You download Rust and then write your first program, which prints “Hello, World!” Here are things I wrote down while reading the first chapter online:

rustup is the preferred version manager
Coming from the JavaScript world, I’m used to scouring the internet for a decent node version manager. The common goto is nvm. Lucky for us, the Rust team supplies an official version manager and it’s called rustup. Free, offline docs - out-of-the-box I noted this after rereading some of Chapter 1. rustup comes with a version of the docs that you can launch and read offline 😱 How genius is that?!

rustup doc
cargo commands are like npm commands
Similar to how we use npm in the JS world for packaging and building our projects, cargo serves a similar purpose for Rust.

Rust leans towards snake_case
In JS, I used camelCase when naming things. It seems like the Rust community leans towards snake_case. This was evident during the hello world exercise. We named the project directory hello_world. My assumption may be premature.

semicolons have meaning
There is a great debate in JS - semicolons or no semicolons? While the choice is mainly conventional in JavaScript, Rust is a bit different. Most of the time, you’ll use them to declare the end of an expression. Here’s an example:

// Rust example
println!("Hello, world!");
Like all good rules in programming languages, there is an exception! If you don’t include it in a code block, it returns the last line. Here’s what that looks like:

// Rust
if x < 5 {
x + 1
}
There is no semicolon but this will still return x plus 1. Reminds me of the arrow function implicit return in JavaScript:

// JavaScript
const firstName = () => 'Rusty'
Rust has an official code formatter
If you’re not familiar with the Prettier, it’s an opinionated code formatter. It supports a lot of different languages. I believe it’s the most used one in JavaScript. A positive note about Rust is that they have an official formatter called rustfmt. And even better, the Rust book says,

The Rust team plans to eventually include this tool with the standard Rust distribution

Official formatting - hooray! Another thing we don’t have to worry about.

Rust uses macros
I wasn’t familiar with this because JavaScript does not have them. They look like functions, but according to Computer Hope, macros are “a tool that allows a developer to re-use code.” I thought it was like a function, but they have a note saying,

A macro is not the same as a function. Functions require special instructions and computational overhead to safely pass arguments and return values. A macro is a way to repeat frequently-used lines of code.

Here is an example using the println! macro in Rust:

// Rust
println!("Howdy, friend!");
The “!” in “println!” means it’s a macro
After learning about macros, I asked myself, “But how do you know if it’s a local function vs. macro?” Then I realized, it’s the !. That’s the pattern to look for.

“Binary executable” is fancy terms for “computer-ready-file”
I’ve heard the term “binary executable.” I know what “binary” means and I know what “executable” means, but I highlighted this anyway. In layperson terms, it means the computer can read and execute it without anyone’s help.

Compile before you run, you must
When I learned JavaScript, I never fully understood the whole compiled vs interpreted lingo. Well, now I have a basic understanding. In most cases, a JavaScript engine (like V8) “compiles JavaScript code into machine code at execution by implementing a JIT (Just-In-Time) compiler.” Notice though, the JS engine does this, not the developer.

In Rust (and many other languages), there is a compile step that you, the developer, must do. So you must compile your code before you can run it.

Ahead-of-time compilation is awesome
I hadn’t previously heard this phrase “ahead-of-time compilation” but now I get what it is and why it’s awesome. You compile your program and it outputs a file. Because you compiled “ahead of time” 😉 you can send it to a friend who can then run it on their machine without having Rust. That’s amazing! At least coming from JS/Python. With Rust, it’s already ready to go!

cargo new, what it do?
Going back to our npm comparison, it is like npm init and creates a new Rust project. What makes it even better though is that it includes a .gitignore file for you. It’s fantastic.

crates are like npm packages
Crates are bundled up pieces of code. Similar to the JS world, you install a package from npm, you do the same with Rust, but with crates. I love the term “crate.” It’s kind of fun to say and isn’t an everyday term like “packages”. The official crates registry is crates.io.

The other differentiating factor is that crates.io is “managed by members of the Crates.io and Rust core teams.” I hope this means it’s more sustainable and community-driven.

Rust encourages project folder structure
Coming from the JS world, you can put your files in any directory you want (most of the time). You then tell your bundler where to look. What I like about Rust is that it encourages a project folder structure out the gate. According to the book, “Cargo expects your source files to live inside the src directory.” This is great! One less thing for us to think about. You can, of course, override this by setting the path value in your cargo.toml (I googled out of curiosity).

cargo check - “Am I doing this right?”
cargo check will check your source code without building it. This is a good way to iterate quickly.

cargo build —release - “Ship it!”
This one is more of a reminder for me. When you’re ready to ship your code to production, add the release flag to your build step:

cargo build --release
fn: function keyword is only two letters
In JavaScript, we have to use seven keystrokes to declare a function. That’s a lot! But in Rust, we only need to write two: fn. How cool is that? We’re five keystrokes richer in Rust.

What’s next?
As previously mentioned, next up for me is Chapter 2 of the Rust Lang Book. Here, they’ll walk us through programming a guessing game - hooray! I’m excited about this.

The next blog post in this series will cover my notes on building my first real project in Rust. Until then, happy coding my fellow Rustaceans! 🦀

P.S. - I included a glossary and cheatsheet at the end here. Enjoy!

Glossary
I covered a decent number of new words (at least for me) in this post. I find it helpful to remind myself what they each mean. Here are they are described in my own words:

ahead-of-time compilation - compiling beforehand
binary executable - a file that a computer already understands
Cargo - Rust’s official build system and package manager
crate - a bundle of code that you can use in your project
crates.io - the official Rust package registry
developer advocate - someone who can talk about and write code and works with the dev community
macro - it’s like a global function
Rustacean - a Rust community member
rustup - the official Rust version manager
WASM - Web Assembly
Cheatsheet
Most of the commands that were covered in Chapter 1:

Install Rust with rustup
curl --proto '=https' --tlsv1.2 -sSf <https://sh.rustup.rs> | sh
Update to the latest version of Rust
rustup update
Check your version of Rust
rustc --version
Open the docs for Rust locally (available offline too)
rustup doc
Manually compile a file
rustc main.rs
Check your version of cargo
cargo --version
Create a new Rust program
cargo new <project_name>

## Example for a project named hello_world

cargo new hello_world
Check that Rust program compiles
cargo check
Build a Rust program
cargo build
Run a Rust program
cargo run
Build a Rust program for production
cargo build --release
