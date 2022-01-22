type t

type options

type identityOptions = {"username": string, "password": string}

type loggerOptions = {"info": string => unit, "warn": string => unit, "error": string => unit}

@obj
external makeClientOptions: (
  ~options: {..}=?,
  ~connection: {..}=?,
  ~identity: identityOptions=?,
  ~channels: array<string>=?,
  ~logger: loggerOptions=?,
  unit,
) => options = ""

@module("tmi.js") @new external createClient: options => t = "Client"
