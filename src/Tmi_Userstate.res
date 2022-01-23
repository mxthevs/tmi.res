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

type user_notice_state = {
  ...common_userstate,
  "login": string,
  "message": string,
  "system-msg": option<string>,
}

type common_sub_userstate = {
  ...user_notice_state,
  "msg-param-sub-plan": Tmi_Subs.method,
  "msg-param-sub-plan-name": string,
}

type common_giftsub_userstate = {
  ...common_sub_userstate,
  "msg-param-recipient-display-name": string,
  "msg-param-recipient-id": string,
  "msg-param-recipient-user-name": string,
  "msg-param-months": string, // TODO: string | bool
}

type sub_state = {
  ...common_sub_userstate,
  "message-type": [#sub | #resub],
  "msg-param-cumulative-months": string, // TODO: string | bool
  "msg-param-should-share-streak": bool,
  "msg-param-streak-months": string, // TODO: string | bool
}

type chat_message = {
  ...common_userstate,
  "message-type": [#chat | #action | #whisper],
  "username": string,
  "bits": string,
}

type delete_message = {"login": string, "message": string, "target-msg-id": string}

type prime_upgrade = {...common_sub_userstate, "message-type": [#primepaidupgrade]}

type subgift = {...common_giftsub_userstate, "message-type": [#subgift]}
type sub_mysterygift = {
  ...common_sub_userstate,
  "message-type": [#submysterygift],
  "msg-param-sender-count": bool, // TODO: string | bool
  "msg-param-origin-id": string,
}

type subgift_upgrade = {
  "message-type": [#giftpaidupgrade],
  "msg-param-sender-name": string,
  "msg-param-sender-login": string,
}

type anon_sub_gift = {...common_sub_userstate, "message-type": [#anonsubgift]}
type anon_sub_mysterygift = {...common_sub_userstate, "message-type": [#anonsubmysterygift]}
type anon_subgift_upgrade = {...common_sub_userstate, "message-type": [#anongiftpaidupgrade]}
