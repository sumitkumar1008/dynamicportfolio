// Form Validation
function validateContactForm() {
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const message = document.getElementById("message").value.trim();
    
    // Name validation
    if (name === "") {
        alert("Name is required!");
        return false;
    }
    
    // Email validation (basic check for @)
    if (email === "" || email.indexOf("@") === -1) {
        alert("Please enter a valid email!");
        return false;
    }
    
    // Message validation
    if (message === "") {
        alert("Message is required!");
        return false;
    }
    
    return true;
}

// Registration Form Validation
function validateRegisterForm() {
    const username = document.getElementById("username").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    
    if (username === "") {
        alert("Username is required!");
        return false;
    }
    
    if (email === "" || email.indexOf("@") === -1) {
        alert("Please enter a valid email!");
        return false;
    }
    
    if (password === "" || password.length < 6) {
        alert("Password must be at least 6 characters!");
        return false;
    }
    
    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return false;
    }
    
    return true;
}

// Login Form Validation
function validateLoginForm() {
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value;
    
    if (username === "") {
        alert("Username is required!");
        return false;
    }
    
    if (password === "") {
        alert("Password is required!");
        return false;
    }
    
    return true;
}
