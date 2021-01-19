package com.mf.mofang.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 返回数据
 *
 * @author Mark sunlightcs@gmail.com
 */

public class R extends HashMap<String, Object> {

    public R() {
        put("code", 0);
        put("msg", "success");
    }

    public static R error() {
        return error(500, "服务器内部处理错误");
    }

    public static R error(String msg) {
        return error(500, msg);
    }

    public static R error400() {
        return error(400, "操作有误");
    }

    public static R error400(String msg) {
        return error(400, msg);
    }

    public static R error(int code, String msg) {
        R r = new R();
        r.put("code", code);
        r.put("msg", msg);
        return r;
    }

    public static R ok(String msg) {
        R r = new R();
        r.put("msg", msg);
        return r;
    }

    public static R ok(Map<String, Object> map) {
        R r = new R();
        r.putAll(map);
        return r;
    }

    public static R ok() {
        return new R();
    }

    public int getCode() {
        return (int) this.get("code");
    }

    @Override
    public R put(String key, Object value) {
        super.put(key, value);
        return this;
    }

    public R putData(Object value) {
        put("data", value);
        return this;
    }

    public Object getData() {
        return get("data");
    }
}
