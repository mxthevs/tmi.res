# tmi.res

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

```reasonml
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

let () = client->connect
```