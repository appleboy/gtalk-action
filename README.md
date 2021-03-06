# 🚀 Gtalk for GitHub Actions

[GitHub Action](https://developer.github.com/actions/) for sending a [Gtalk](https://developers.google.com/talk) notification message. You can get the OAuth token in [Google playground](https://developers.google.com/oauthplayground/). Please set the scope as `https://www.googleapis.com/auth/googletalk`.

[![Actions Status](https://github.com/appleboy/gtalk-action/workflows/gtalk%20message/badge.svg)](https://github.com/appleboy/gtalk-action/actions)

![logo](./images/logo.png)

## Usage

Send custom message as below

```yaml
name: gtalk message
on: [push]
jobs:

  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: send custom message with args
      uses: appleboy/gtalk-action@master
      with:
        username: ${{ secrets.USERNAME }}
        oauth_token: ${{ secrets.OAUTH_TOKEN }}
        to: ${{ secrets.TO}}
        args: The ${{ github.event_name }} event triggered first step.

```

## Input variables

* username - required. gtalk user email.
* oauth_token - required. AuthToken provides go-xmpp with the required OAuth2 token used to authenticate. Get token from [OAuth Playground](https://developers.google.com/oauthplayground/).
* to - required. send message to user.
* message - optional. custom message.

## Example

Send custom message in `message`

```yaml
- name: send message
  uses: appleboy/gtalk-action@master
  with:
    username: ${{ secrets.USERNAME }}
    oauth_token: ${{ secrets.OAUTH_TOKEN }}
    to: ${{ secrets.TO}}
    message: The ${{ github.event_name }} event triggered first step.
```

Send the default message.

```yaml
- name: send message
  uses: appleboy/gtalk-action@master
  with:
    username: ${{ secrets.USERNAME }}
    oauth_token: ${{ secrets.OAUTH_TOKEN }}
    to: ${{ secrets.TO}}
```
