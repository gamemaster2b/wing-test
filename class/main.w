bring cloud;
bring ex;

class Store {
    storeBucket: cloud.Bucket;
    storeRedis: ex.Redis;

    init() {
        this.storeBucket = new cloud.Bucket();
        this.storeRedis = new ex.Redis();
    }

    inflight store(data: str) {
        this.storeBucket.put("data.txt", data);
        this.storeRedis.set("data", data);
        log("Hello ${data}");
    }
}

let worldStore = new Store() as "WorldStore";
let wingStore = new Store() as "WingStore";

let hello = new cloud.Function(inflight () => {
    worldStore.store("World");
    wingStore.store("Wing");
}) as "Hello";