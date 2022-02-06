# tmi.res

ReScript bindings for the tmi.js library. For more info and documentation, checkout the original project [here](https://github.com/tmijs/tmi.js).

> ⚠️ **DISCLAIMER**: This library is not complete yet. But it has the basic bindings to get a chatbot up and running.

## Install

```console
yarn add tmi.js tmi.res
```

Add tmi.res to `bs-dependencies` in your `bsconfig.json` file:

```json
"bs-dependencies": [
  "tmi.res"
]
```

```rescript
open Tmi

let client = createClient(
  makeOptions(
    ~options=Options.make(~debug=true, ~messagesLogLevel=#info, ()),
    ~connection=Connection.make(~reconnect=true, ~secure=true, ()),
    ~identity=Identity.make(~username="bot-name", ~password="oath:my-bot-token"),
    ~channels=["my-channel"],
    (),
  ),
)

client->connect()

let onMessageHandler = (channel, tags, message, self) => {
  if !self && message->Js.String2.toLocaleLowerCase == "!hello" {
    client->say(channel, `@${tags["username"]}, heya!`)
  }
}

client->on(#message(onMessageHandler))
```
