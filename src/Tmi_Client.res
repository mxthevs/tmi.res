type t

module Options = {
  type t

  @obj
  external make: (
    ~clientId: string=?,
    ~debug: bool=?,
    ~joinInterval: string=?,
    ~globalDefaultChannel: string=?,
    ~messagesLogLevel: [#info | #warn | #error]=?,
    ~skipMembership: bool=?,
    ~skipUpdatingEmotesets: bool=?,
    ~updateEmotesetsTimer: int=?,
    unit,
  ) => t = ""
}

module Connection = {
  type t

  @obj
  external make: (
    ~server: string=?,
    ~port: int=?,
    ~reconnect: bool=?,
    ~maxReconnectAttempts: int=?,
    ~maxReconnectInverval: int=?,
    ~reconnectDecay: int=?,
    ~reconnectInterval: int=?,
    ~secure: bool=?,
    ~timeout: int=?,
    unit,
  ) => t = ""
}

module Identity = {
  type t

  @obj
  external make: (~username: string, ~password: string) => t = ""
}

type logger = {"info": string => unit, "warn": string => unit, "error": string => unit}

type options = {
  options: Options.t,
  connection: Connection.t,
  identity: Identity.t,
  channels: array<string>,
  logger: logger,
}

@obj
external makeOptions: (
  ~options: Options.t=?,
  ~connection: Connection.t=?,
  ~identity: Identity.t=?,
  ~channels: array<string>=?,
  ~logger: logger=?,
  unit,
) => options = ""

@module("tmi.js") @new external createClient: options => t = "Client"

open Tmi_Userstate

@send
external on: (
  t,
  @string
  [
    | #action((string, chat_message, string, bool) => unit)
    | #anongiftpaidupgrade((string, string, anon_subgift_upgrade) => unit)
    | #anonsubmysterygift((string, int, Tmi_Subs.methods, anon_sub_mysterygift) => unit)
    | #anonsubgift((string, int, string, Tmi_Subs.methods, anon_sub_gift) => unit)
    | #automod((string, [#msg_rejected | #msg_rejected_mandatory], string) => unit)
    | #ban((string, string, string) => unit)
    | #chat((string, chat_message, string, bool) => unit)
    | #cheer((string, chat_message, string) => unit)
    | #clearchat(string => unit)
    | #connected((string, int) => unit)
    | #connecting((string, int) => unit)
    | #disconnected(string => unit)
    | #emoteonly((string, bool) => unit)
    | #emotesets((string, Tmi_Emotes.t) => unit)
    | #followersonly((string, bool, int) => unit)
    | #giftpaidupgrade((string, string, string, subgift_upgrade) => unit)
    | #hosted((string, string, int, bool) => unit)
    | #hosting((string, string, int) => unit)
    | #join((string, string, bool) => unit)
    | #logon(unit => unit)
    | #message((string, chat_message, string, bool) => unit)
    | #messagedeleted((string, string, string, delete_message) => unit)
    | #mod((string, string) => unit)
    | #mods((string, array<string>) => unit)
    | #notice((string, Tmi_Message.id, string) => unit)
    | #part((string, string, bool) => unit)
    | #ping(unit => unit)
    | #pong(float => unit)
    | #primepaidupgrade((string, string, Tmi_Subs.methods, prime_upgrade) => unit)
    | #r9kbeta((string, bool) => unit)
    | #raided((string, string, int) => unit)
    | #raw_message((Js.Dict.t<string>, Js.Dict.t<string>) => unit)
    | #reconnect(unit => unit)
    | #redeem((string, string, string, chat_message) => unit)
    | #resub((string, string, int, string, sub_state, Tmi_Subs.methods) => unit)
    | #roomstate((string, Tmi_Room.state) => unit)
    | #serverchange(string => unit)
    | #slowmode((string, bool, int) => unit)
    | #subgift((string, string, int, string, Tmi_Subs.methods, subgift) => unit)
    | #submysterygift((string, string, int, Tmi_Subs.methods, sub_mysterygift) => unit)
    | #subscribers((string, bool) => unit)
    | #subscription((string, string, Tmi_Subs.methods, string, sub_state) => unit)
    | #timeout((string, string, string, int) => unit)
    | #unhost((string, int) => unit)
    | #unmod((string, string) => unit)
    | #vips((string, array<string>) => unit)
    | #whisper((string, chat_message, string, bool) => unit)
  ],
) => unit = "on"

@send
external action: (t, string, string) => unit = "action"

@send
external ban: (t, string, string, ~reason: string=?) => unit = "ban"

@send
external clear: (t, string) => unit = "clear"

@send
external color: (t, string) => unit = "color"

@send
external commercial: (t, string, int) => unit = "commercial"

@send external connect: t => unit = "connect"

@send
external deletemessage: (t, string, string) => unit = "deletemessage"

@send
external disconnect: t => unit = "disconnect"

@send
external emoteonly: (t, string) => unit = "emoteonly"

@send
external emoteonlyoff: (t, string) => unit = "emoteonlyoff"

@send
external followersonly: (t, string, ~length: int=?) => unit = "followersonly"

@send
external followersonlyoff: (t, string) => unit = "followersonlyoff"

@send
external host: (t, string, string) => unit = "host"

@send
external join: (t, string) => unit = "join"

@send
external mod: (t, string, string) => unit = "mod"

@send
external mods: (t, string) => array<string> = "mods"

@send
external part: (t, string) => unit = "part"

@send
external ping: t => unit = "ping"

@send
external r9kbeta: (t, string) => unit = "r9kbeta"

@send
external r9kbetaoff: (t, string) => unit = "r9kbetaoff"

@send
external say: (t, string, string) => unit = "say"

@send
external slow: (t, string, ~length: int=?) => unit = "slow"

@send
external slowoff: (t, string) => unit = "slowoff"

@send
external subscribers: (t, string) => unit = "subscribers"

@send
external subscribersoff: (t, string) => unit = "subscribersoff"

@send
external timeout: (t, string, string, ~length: int=?, ~reason: string=?, unit) => unit = "timeout"

@send
external unban: (t, string, string) => unit = "unban"

@send
external unhost: (t, string) => unit = "unhost"

@send
external unmod: (t, string, string) => unit = "unmod"

@send
external unvip: (t, string, string) => unit = "unvip"

@send
external vip: (t, string, string) => unit = "vip"

@send
external vips: (t, string) => array<string> = "vips"

@send
external whisper: (t, string, string) => unit = "whisper"
