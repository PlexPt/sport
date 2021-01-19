function jump(url) {
    window.location.href = url;
}

function save(token) {
    window.localStorage.setItem("token", JSON.stringify(token));
}

