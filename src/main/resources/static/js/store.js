function gettoken() {
    return JSON.parse(window.localStorage.getItem("token") || '');
}

function save(token) {
    window.localStorage.setItem("token", JSON.stringify(token));
}

