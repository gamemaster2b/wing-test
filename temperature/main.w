bring cloud;

let q = new cloud.Queue();
let b = new cloud.Bucket();

new cloud.Function(inflight (t: num, m: str) => {
  if m == "c" {
    q.push((t * 9 / 5) + 32);
  }
});