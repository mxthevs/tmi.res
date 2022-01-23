module String_or_boolean: {
  type t

  type case =
    | String(string)
    | Boolean(bool)

  let string: string => t
  let boolean: bool => t

  let classify: t => case
} = {
  @unboxed
  type rec t = Any('a): t

  type case =
    | String(string)
    | Boolean(bool)

  let string = (v: string) => Any(v)
  let boolean = (v: bool) => Any(v)

  let classify = (Any(value): t): case => {
    if Js.typeof(value) == "boolean" {
      Boolean((Obj.magic(value): bool))
    } else {
      String((Obj.magic(value): string))
    }
  }
}
