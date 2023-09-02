bring cloud;
bring ex;

let b = new cloud.Bucket();
let r = new ex.Redis();

let getMode = new cloud.Function(inflight (t: str) => {
  r.set("mode", t);
}) as "getMode";

let getTemp = new cloud.Function(inflight (t: str) => {
  r.set("temp", t);
}) as "getTemp";

let convert = new cloud.Function(inflight () => {
  let mode = r.get("mode");
  let var tempStr = r.get("temp");
  let temp = num.fromStr(tempStr);
  if (mode == "C") {
    b.put("temp.txt", (temp * 9 / 5 + 32));
  } else {
    b.put("temp.txt", ((temp - 32) * 5 / 9));
  }
}) as "convert";