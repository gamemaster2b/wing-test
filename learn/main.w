bring cloud;

let q = new cloud.Queue();
let b = new cloud.Bucket() as "Bucket: Last Message";

new cloud.Function(inflight (s: str) => {
    if s == "" {
        log("Function was invoked without a payload.");
        q.push("Function was invoked without a payload.");
    }
    else {
        log("Function was called with argument '${s}'");
        q.push("Function was called with argument '${s}'");
    }
});

q.setConsumer(inflight (m: str) =>  {
    b.put("latest.txt", m);
    log("File 'latest.txt' was updated with message '${m}'");
});
