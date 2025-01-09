# Highlighted Deep Dive Into Polkadot/Substrate/Kusama/Rust-Lang/Part(7)

**Dr.Gavin-Wood #Polkadot#kusama#ParaState#Substrate#Rust-Lang**

👩‍🏫👩‍🏫👩‍🏫

![Rust-Arch1](https://cdn.rcimg.net/arman-riazi-science/d224eb3a/dd43956a5b18c9d8c13ee3c416055388.png?width=700)1

![Rust-Arch2](https://cdn.rcimg.net/arman-riazi-science/d224eb3a/d31b1145f3d2f6da724cabe54d3244fd.png?width=700)

![Rust-Arch3](https://cdn.rcimg.net/arman-riazi-science/d224eb3a/fded031136fb019c9a4b1166506ea6ce.png?width=700)

## Features

👆👆👆

## Crates

# Alloc

The Rust core allocation and collections library

This library provides **smart pointers and collections** for managing heap-allocated values. This library, like libcore, **normally doesn’t need to be used directly since its contents are re-exported in the std crate. Crates that use the #![no_std] attribute however will typically not depend on std, so they’d use this crate instead.**

<https://doc.rust-lang.org/alloc/index.html>

# **Core**

The Rust Core Library

The Rust Core Library is the **dependency-free1 foundation of The Rust Standard Library.** It is the portable **glue between the language and its libraries,** defining the intrinsic and primitive building blocks of all Rust code. **It links to no upstream libraries, no system libraries, and no libc.**

The core library is minimal: it **isn’t even aware of heap allocation, nor does it provide concurrency or I/O.** These things require platform integration, and this library is platform-agnostic.

<https://doc.rust-lang.org/core/index.html>

# **Crate proc_macroCopy**

A support library for macro authors when defining new macros.

This library, provided by the standard distribution, provides the types consumed in the interfaces of procedurally defined macro definitions such **as function-like macros #[proc_macro], macro attributes #[proc_macro_attribute] and custom derive attributes#[proc_macro_derive].**

<https://doc.rust-lang.org/proc_macro/index.html>

# **Std(The Rust Standard Library)**

The Rust Standard Library is the foundation of portable Rust software, a set of minimal and battle-tested shared abstractions for the broader Rust ecosystem. It offers core types, like Vec<T> and Option<T>, library-defined operations on language primitives, standard macros, I/O and multithreading, among many other things.

**std is available to all Rust crates by default.** Therefore, the standard library can be accessed in use statements through the path std, as in use std::env.

<https://doc.rust-lang.org/std/index.html>

# Test

Support code for rustc’s built in unit-test and **micro-benchmarking framework.**

Almost all user code will only be interested in Bencher and **black_box**. All other interactions (such as writing tests and benchmarks themselves) should be done via the #[test] and #[bench] attributes.

See the Testing Chapter of the book for more details.

<https://doc.rust-lang.org/test/index.html>

👆👆👆

## Memory

Rust programs have 3 memory regions where data is stored:

> Data memory - For data that is fixed in size and **static (i.e. always available through life of program).** Consider the text in your program (e.g. "Hello World!"): This text's bytes are only ever read from one place and therefore can be stored in this region. Compilers make lots of optimizations with this kind of data, and they are generally considered **very fast to use since locations are known and fixed.**

> Stack memory - For data that is declared as **variables** within a function. The location of this memory **never changes** for the duration of a function call; because of this compilers can optimize code so stack data is very fast to access.

> Heap memory - **For data that is created while the application is running.** Data in this region may be added, moved, removed, resized, etc. Because of its **dynamic** nature it's generally considered **slower** to use, but it allows for much more creative usages of memory. When data is added to this region we call it an **allocation**. When data is removed from this section we call it a **deallocation**.

## Thread

# LifeTime

@Static

A static variable is a memory resource created at **compile-time** that exists through a **program start to finish**. They must have their types explicitly specified so special lifetime lasting the entire program execution.

A static lifetime is a memory resource that lasts indefinitely to the end of a program. Note that by this definition **some static lifetime resources can be created at runtime.**

**Lifetime specifiers always start with a ' (e.g. 'a, 'b, 'c).**

Resources with static lifetimes have a special lifetime specifier 'static.

**'static resources will never drop. If static lifetime resources contain references** they must all be 'static (anything less would not live long enough).

```
fn main() {
    let mut foo = Foo { x: 42 };
    let x = &mut foo.x;
    *x = 13;
    // x is dropped here, allowing us to create a non-mutable reference
    let y = do_something(&foo);
    println!("{} {}", y, foo.x);
    // y is dropped here
    // foo is dropped here
}
/*
Standard Output
42
*/
```

Memory detail:

Modifying static variables is inherently dangerous because they are globally accessable to be read from by anyone introducing the possibility of a data race.

static X: T = T(); Global variable with 'static lifetime, **single memory location.**

T: 'static Same; does esp. not mean value t will live 'static, only that it could.

Language Sugar:

Rvalue Static Promotion Makes references to constants 'static, e.g., &42, &None, &mut [].

Promote constexpr rvalues to values in static memory instead of stack slots, and expose those in the language by being able to directly create 'static references to them.

This would allow code like let x: &'static u32 = &42 to work.

```
static PI: f64 = 3.1415;

fn main() {
    // static variables can also be scoped to a function
    static mut SECRET: &'static str = "swordfish";

    // string literals have a 'static lifetime
    let msg: &'static str = "Hello World!";
    let p: &'static f64 = &PI;
    println!("{} {}", msg, p);

    // You can break some rules, but you must be explicit
    unsafe {
        // we can set SECRET to a string literal because it is also `static
        SECRET = "abracadabra";
        println!("{}", SECRET);
    }
}
/*
Standard Output
Hello World! 3.1415
abracadabra
*/
```

@Unsafe

If you still had access to (via unsafe) they might still look like valid S, but any attempt to use them as valid S is undefined behavior. ↓

<https://cheats.rs/#unsafe-unsound-undefined-dark> side of force

Try to avoid "unsafe {}", often safer, faster solution without it. Exception: FFI.

# Arc

@Safe

Arc presents us with a couple of use statements that include threads and something called Arc. **Arc represents a thread-safe reference-counting pointer, and Arc stands for Atomically Reference Counted.** You may know of this idea from old iOS Objective-C code or something like that.

```
// arc1.rs
// Make this code compile by filling in a value for `shared_numbers` where the
// TODO comment is and create an initial binding for `child_numbers`
// somewhere. Try not to create any copies of the `numbers` Vec!
// Execute `rustlings hint arc1` for hints :)

use std::sync::Arc;
use std::thread;

fn main() {
    let numbers: Vec<_> = (0..100u32).collect();
    let shared_numbers = Arc::new(numbers);
    let mut joinhandles = Vec::new();

    for offset in 0..8 {
        let child_numbers = shared_numbers.clone();
        joinhandles.push(thread::spawn(move || {
            let mut i = offset;
            let mut sum = 0;
            while i < child_numbers.len() {
                sum += child_numbers[i];
                i += 5;
            }
            println!("Sum of offset {} is {}", offset, sum);
        }));
    }
    for handle in joinhandles.into_iter() {
        handle.join().unwrap();
    }
}

```

- What Arc does is provides **shared ownership of a value allocated in the heap.** Invoking clone on Arc gives you a new Arc instance, which points to the same allocation on the heap as the original source Arc. What Arc will do is then increase the reference count, and **it will not drop the value inside of the Arc until the last reference has dropped.**

- In this code, what we need to do is set a value for shared*numbers and then also create an initial binding for child_numbers such that **we can use the value inside of the multiple threads** that are spawned for the range zero to eight. Note that numbers here is a Vec which we've told the Rust compiler to infer the type of with this <*>, and also told that the type by using a range of to 100 as u32.

- For shared_numbers, what we'll do is **create a new Arc**. Note that we also need to use new binding for child_numbers. We have a number of places we could put it, including right below shared_numbers or **inside of this loop.**

- We're going to do this inside of the loop **so that we create a new clone and increase the Arc reference counter for every offset that we spawn a new thread for.**

- Note that shared_numbers is a new Arc that contains the Vec for each offset in the range zero to eight, which we spawn a thread for child_numbers, clones shared_numbers, which increments the Arc counter and **allows child_numbers to access the same data**

👆👆👆
✍️✍️✍️

Let's Start - to setup in 5min

<https://www.gitpod.io/docs/languages/rust#rust-in-gitpod>

Getting started with Toturial

Introduction - Rust By Example

Learn Rust - Rust Programming Language

Tour of Rust - Let's go on an adventure!

In-Depth Rust Tutorials for 2022 | egghead.io

<https://rust-lang.github.io/rustup/examples.html>

📚📚📚

# Literature

<https://doc.rust-lang.org/error-index.html>

Cargo Getting Start

❤️❤️❤️

If you liked this article or if it helped you please clap on this post to help the Read.Cash algorithm recommend it to more people. If you have any questions or remarks please feel free to leave a comment below.

Alternatively, please feel free to send donations 0xde5D732a5AB44832E1c69b18be30834639F44A2c

❤️❤️❤️

Reseacher & Organized by:

🙏#Arman-Riazi🤝
