---
tags:
  - secondstate
  - iot
---

**Highlighted Deep Dive Into Polkadot/Substrate/Kusama/Secondstate(6)**

👩‍🏫👩‍🏫👩‍🏫

## Introducing

For automakers, the runtime isolation reduces complexity in integration and operation. For parts makers, the virtualized runtime supports “write once run on any car”. Second State is developing a real-time, deterministic, and efficient runtime sandbox for automotive applications. It is completely open source and already used by leading auto suppliers.

 Rust could be 25x faster than Python for machine learning.
![Secondstate](https://cdn.rcimg.net/arman-riazi-science/a8138de8/409ef0bb0cbfb8a3d66daa64d0027c6a.png)
![Secondstate](https://cdn.rcimg.net/arman-riazi-science/a8138de8/0571788b3e3cf3ed4f13ac3b1a940a2c.png)
![Secondstate](https://cdn.rcimg.net/arman-riazi-science/a8138de8/c801aa481272248edf07f7923da1772a.png)

👆👆👆

## SSVM

The Second State Functions is based on the **Second State WebAssembly VM (SSVM). It is specifically optimized for server-side applications.**

SSVM is a high-performance WebAssembly runtime for server-side apps. **It is safer and 10x faster than Docker. It supports OS access (WASI), AOT compiler**, stateful apps, seamless integration with Node.js, and access to hardware (AI chips).

Second State provides an open-source WebAssembly implementation (Second State Virtual Machine, or SSVM) that is specifically optimized for server side applications. It is

Best in-class in performance. It is 1000x faster than Docker for cold starts.It starts and runs much faster than VM or **container-based alternatives. It excels in compute intensive media, data, and edge AI apps.**

Seamlessly supports server application frameworks, such as the Node.js. You can build high performance Node.js apps with SSVM.

Supports safe access to external resources, such as databases, message queues, and even new AI hardware

Allows precise metering of computational resources for serverless apps.

## Serverless

@FaaS

is one of the fastest growing areas of cloud computing. FaaS allows developers to **focus on the code.** Once the developer uploads the code, the FaaS takes care of deployment, service availability, and scalability. The developer only **pays for resources the service uses, not reserved idle time.** This approach, known as serverless computing, is the way to build inter-connected and microservice-based applications. The result are fast development turn around, easy deployment, high availability, infinite scalability, at low cost.

However, traditional FaaS are based on microVM (eg Firecracker and gVisor) and application container (eg Docker) technologies. They are general computing platforms not optimized for software stacks. To boot an entire OS and then heavy-weight runtimes just to run a single function is very inefficient. Therefore, existing FaaS solutions suffer from issues such as slow cold start, slow runtime performance, bloated runtime, and time-based billing. They are not suitable for computationally intensive applications.

**High-level language VMs, such as WebAssembly**, offer a combination of ease-of-use, runtime safety, and high performance. The WasmEdge Runtime is a WebAssembly VM that is designed for edge cloud and device applications. It is a great fit for computationally intensive **FaaS applications such as edge AI, real-time data analytics, multimedia processing,** as well as typical transactional functions that need to start in sub-millisecond and make a quick call to another web service.

👆👆👆

## Features

@WasmEdge

WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime for cloud native, edge, and decentralized applications. **It powers serverless apps, embedded functions, microservices, smart contracts, and IoT devices.**

Today’s web apps often have statically generated front ends that use JavaScript to interact with APIs on the backend (ie, the Jamstack).**The WasmEdge is ideally suited for running backend API services as serverless functions**. It is fast, secure, low maintainence, cross-platform, and can be easily deployed on edge networks for high performance.

WebAssembly is the de facto runtime for modern blockchain smart contracts. Ethereum flavored **WebAssembly (Ewasm)** is a collaborative effort to bring the earliest and largest smart contract platform, Ethereum, to the WebAssembly world. **WasmEdge is a leading Ewasm implementation**, and it is already being adopted by leading public blockchains.

@WASI @Tensorflow@ConvolutionalNeuralNetworks

**WASI provides a design pattern** for sandboxed WebAssembly programs to securely access native host functions. The WasmEdge Runtime extends the WASI model to support access to native **Tensorflow libraries from WebAssembly programs**. It provides the security, portability, and ease-of-use of WebAssembly and native speed for Tensorflow.

**Second State FaaS provides** a Rust API to run Tensorflow-based MobileNet models at native speeds. In this article, we will use a MobileNet model trained from the ImageNet dataset as an example.

MobileNet is a class of CNN models for computer vision applications. The most common application for **MobileNet models is image classification.** You can train (or retrain) a MobileNet model to recognize objects that are interesting to your application (e.g., to classify birds in a bird watching application).

The **MTCNN is a class of Multi-task** Cascaded Convolutional Network models. They are very good at detection faces and facial features. **You can train (or retrain) MTCNN models with your own faces dataset** so that it can accurately detect faces for your application.

Second State FaaS provides a Rust API to run Tensorflow-based MTCNN models at native speeds. In this article, we will use the original MTCNN model trained in the FaceNet dataset as an example

👆👆👆

📚📚📚

## Literature

WebAssembly System Interface = WASI

Convolutional Neural Networks = CNN

Function as a Service = FaaS

❤️❤️❤️

Reseacher & Organized by:

🙏Arman-Riazi🤝

[[Polkadot-Ecosystem-Research]]

[[Substrate]]
