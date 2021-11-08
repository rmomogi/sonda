# Baby Sonda

This Baby Sonda version 1!


## Install

### Clone the repository

```shell
git clone git@github.com:rmomogi/sonda.git
cd sonda
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.0.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Set environment variables

Using [dotenv](https://github.com/bkeepers/dotenv):

## Swagger

Generate documentation from API Baby Sonda

```shell
rake rswag:specs:swaggerize
```

After generate, access the [API Documentation] (http://server/api-docs/index.html)

![image](https://user-images.githubusercontent.com/133262/140820191-af4e0bd6-6c84-4dd1-b339-ca4e45ef8588.png)

## Serve

```shell
rails s
```
