function logout() {
    document.cookie = "auth_token=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/fusion; domain=localhost; SameSite=None; Secure"
    window.location.href = "login";
}