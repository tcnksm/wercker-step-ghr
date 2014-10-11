Wercker step ghr [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/tcnksm/wercker-step-ghr/blob/master/LICENCE)
====

[![wercker status](https://app.wercker.com/status/8e4b61d9c3fa9c2f3a41eac9569f21eb/m "wercker status")](https://app.wercker.com/project/bykey/8e4b61d9c3fa9c2f3a41eac9569f21eb)

This is [wercker](http://wercker.com/) step for [tcnksm/ghr](https://github.com/tcnksm/ghr), create [Github Release](https://help.github.com/articles/creating-releases/) and uploading files there. 

## Usage

In the `wercker.yml` of your application use the following step definition:

```yaml
steps:
   - tcnksm/ghr:
     token: $GITHUB_TOKEN
     input: dist
```

To use this step, you need to set `$GITHUB_TOKEN` and `input` directory. About `$GITHUB_TOKEN` see at [Github Token](https://github.com/tcnksm/wercker-step-ghr#github-token) section. `input` directory is where your artifacts you want to upload are in and it's relative path from `${WERCKER_SOURCE_DIR}`. 

## Options

You can control build with some option from `wercker.yml`:

```yaml
steps:
   - tcnksm/ghr:
     token: $GITHUB_TOKEN
     input: dist
     version: v0.1.0         # Relase tag default is `pre-release`
     pre_release: true       # Relase as pre-release default is false
     replace: true           # Replace artifacts if it's already upladed
```

## Example


## GitHub token

To be able to use this step, you will first need to create a GitHub token with an account which has enough permissions to be able to create releases. First goto `Account settings`, then goto `Applications` for the user. Here you can create a token in the `Personal access tokens` section. For a private repository you will need the `repo` scope and for a public repository you will need the `public_repo` scope. Then it is recommended to save this token on wercker as a protected environment variable.


## Author

[tcnksm](https://github.com/tcnksm)
