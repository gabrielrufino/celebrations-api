# Celebrations API 🗓️🎉

<p align="center">
  <img width="300px" src="./assets/logo.png">
</p>

API for celebrations & holidays.

## Authentication & Authorization

### Creating user

> **POST** `/api/users`

```json
{
  "username": "clark",
  "email": "clark@superman.com",
  "password": "loislane"
}
```

### Getting token

> **POST** `/api/auth/local`

**Using username:**
```json
{
  "username": "clark",
  "password": "loislane"
}
```

**Using email:**
```json
{
  "username": "clark@superman.com",
  "password": "loislane"
}
```

## CONTRIBUTING

This is a project made in [Strapi](https://strapi.io/). Feel free to make contributions.

### `develop`

Start your Celebrations API with autoReload enabled. [Learn more](https://docs.strapi.io/developer-docs/latest/developer-resources/cli/CLI.html#strapi-develop)

```
npm run develop
```

### `start`

Start your Celebrations API with autoReload disabled. [Learn more](https://docs.strapi.io/developer-docs/latest/developer-resources/cli/CLI.html#strapi-start)

```
npm run start
```

### `build`

Build your admin panel. [Learn more](https://docs.strapi.io/developer-docs/latest/developer-resources/cli/CLI.html#strapi-build)

```
npm run build
```
