open Tmi

let client = createClient(
  makeOptions(
    ~options=Options.make(~debug=true, ~messagesLogLevel=#info, ()),
    ~connection=Connection.make(~reconnect=true, ~secure=true, ()),
    ~channels=["xQcOW"],
    (),
  ),
)

let () = client->connect
