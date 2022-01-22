type badges = {
  "admin": option<string>,
  "bits": option<string>,
  "broadcaster": option<string>,
  "partner": option<string>,
  "global_mod": option<string>,
  "moderator": option<string>,
  "vip": option<string>,
  "subscriber": option<string>,
  "staff": option<string>,
  "turbo": option<string>,
  "premium": option<string>,
  "founder": option<string>,
  "bits-leader": option<string>,
  "sub-gifter": option<string>,
}

type badge_info = {"subscriber": option<string>}

type common_userstate = {
  "badges": badges,
  "badge-info": badge_info,
  "color": string,
  "display-name": string,
  "emotes": Js.Dict.t<array<string>>,
  "id": string,
  "mod": bool,
  "turbo": bool,
  "emotes-raw": string,
  "badges-raw": string,
  "badge-info-raw": string,
  "room-id": string,
  "subscriber": bool,
  "user-type": [#mod | #global_mod | #admin | #staff],
  "user-id": string,
  "tmi-sent-ts": string,
  "flags": string,
}

type chat_userstate = {
  ...common_userstate,
  "message-type": [#chat | #action | #whisper],
  "username": string,
  "bits": string,
}
