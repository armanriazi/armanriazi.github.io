
# NestJS
## Microservice
### Implementation

<details>
<summary>Vimeo 16min</summary>

[Main Link](https://vimeo.com/883191398)
<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/910976328?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" style="position:absolute;top:0;left:0;width:100%;height:100%;" title="NestJS-Microservices-Part-1"></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>
</details>

## Installation

```bash
$ pnpm install
```

## Running the app

```bash
# development
$ pnpm run start

# watch mode
$ pnpm run start:dev

# production mode
$ pnpm run start:prod
```

## Test

```bash
# unit tests
$ pnpm run test

# e2e tests
$ pnpm run test:e2e

# test coverage
$ pnpm run test:cov
```


## Environment 

```bash
NEST_DEBUG = true
```

## Watch Directory 

The strategy for how entire directory trees are watched under systems that lack recursive file-watching functionality.

- [x] fixedPollingInterval: Check every directory for changes several times a second at a fixed interval.
- [x] dynamicPriorityPolling: Use a dynamic queue where less-frequently modified directories will be checked less often.
- [x] useFsEvents (the default): Attempt to use the operating system/file system’s native events for directory changes.

```json
"compilerOptions":{
"watchOptions": {
    "watchFile": "fixedPollingInterval"
  }
}  
```

## Circular Dependency Packages

`Nest can't resolve dependencies of the <provider> (?).`

[DependenciesMetaInjected](https://pnpm.io/package_json#dependenciesmetainjected)

```json
{
  "name": "card",
  "dependencies": {
    "@nestjs/core": "workspace:10.0.0",
    "react": "16"
  },
  "dependenciesMeta": {
    "@nestjs/core": {
      "injected": true
    }
  }
}
```


# Nest.js Microservices

This repository contains 3 Nest.js projects:

- http-api-gateway
- orders-microservice
- users-microservice

You can find the video tutorial for this project [here](https://player.vimeo.com/video/910976328)

# Getting Started

Want to set this up locally on your own? The best way to set this project up is by using Docker.

1. Pull down this repository and make sure you install each project's dependencies by running `npm run install`.

2. Ensure Docker is running then run `docker-compose up --build` to build the container, and images, and pull down the Postgres and nats images from Docker.

3. Verify that all services are up and running. The HTTP Server runs on port 3000.

# Application Structure

## Features

- [x] Microservice Architecture
- [x] Monorpo
- [x] TypeORM
- [x] CQRS
- [x] JWT

### HTTP API Gateway

This is a [hybrid application](https://docs.nestjs.com/faq/hybrid-application) that uses both HTTP and NATS as sources to listen to requests. This is the entry point to the entire platform. It forwards the request by publishing a message to the NATS server, and then the NATS server distributes it to its subscribers.

Any HTTP API endpoints should be defined in this project.

### Orders Microservice

This is a sample microservice that has a createOrder event handler from the NATS server whenever it is triggered. It will create a order record and save it to the database.

### Users Microservice

This is a user microservice that has a createUser event handler from the NATS server whenever it is triggered. It will create a user record and save it to the database.


# Monorepo 

Config file for subprojects to build independent of the other projects or monorepo building. Before building with Monorepo, we must build sub-projects independently based on the following configuration.

```json
{
  "compilerOptions": {
    "module": "commonjs",
    "declaration": true,
    "removeComments": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "allowSyntheticDefaultImports": true,
    "target": "ES2021",
    "sourceMap": true,
    "outDir": "./dist",
    "baseUrl": "./",
    "incremental": true,
    "skipLibCheck": true,
    "strictNullChecks": false,
    "noImplicitAny": false,
    "strictBindCallApply": false,
    "forceConsistentCasingInFileNames": false,
    "noFallthroughCasesInSwitch": false
  },
  "watchOptions": {
    "watchFile": "dynamicPriorityPolling",
    "watchDirectory": "dynamicPriorityPolling",
    "excludeDirectories": [
      "**/node_modules",
      "dist"
    ]
  }
}
```

## Support

Nest is an MIT-licensed open-source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## License

Nest is [MIT licensed](LICENSE).
