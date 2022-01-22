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

@send external connect: t => unit = "connect"

@send
external on: (
  t,
  @string
  [
    | #message((string, 'channel_userstate, string, bool) => unit)
  ],
) => unit = "on"

@send
external say: (t, string, string) => unit = "say"
