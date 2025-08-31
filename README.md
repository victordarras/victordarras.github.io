# Website generator

## Install

```bash
npm install
```

Ensure `grunt` is available in CLI

```bash
npm install -g grunt-cli --save-dev
```

Then you'll have 3 commands :

- `grunt` : Run dev server and auto-build
- `grunt build` : Build for production
- `grunt deploy-staging` : Deploy the website in a `/staging` directory
- `grunt deploy-production` : Deploy the production ready build

## Infos

I used *Slim* and *Stylus* for templating, and a small JS for dynamic navigation.

## Slim partials

Be carefull, the path should be *relative* to the Gruntfile and the method needs *2 equal signs*.

```slim
== Slim::Template.new('src/_content-accueil.slim').render
```

## Inline assets

Stylesheet and javascript are inlined by grunt on build, ensure to declare them with `?__inline=true` like :

```slim
link href="style.css?__inline=true" media="screen" rel="stylesheet" type="text/css"
```
