// Dark and Light Mode Toggle

// Check if dark mode is saved in local storage
function loadTheme() {
    const savedTheme = localStorage.getItem("theme");
    if (savedTheme === "dark") {
        document.body.classList.add("dark-mode");
    }
}

// Toggle Theme
function toggleTheme() {
    document.body.classList.toggle("dark-mode");
    
    // Save preference
    if (document.body.classList.contains("dark-mode")) {
        localStorage.setItem("theme", "dark");
    } else {
        localStorage.setItem("theme", "light");
    }
    
    // Update button text/icon
    updateThemeButton();
}

// Update theme button text
function updateThemeButton() {
    const themeBtn = document.getElementById("themeToggle");
    if (themeBtn) {
        const isDarkMode = document.body.classList.contains("dark-mode");
        themeBtn.textContent = isDarkMode ? "☀️ Light Mode" : "🌙 Dark Mode";
    }
}

// Load theme on page load
window.addEventListener("DOMContentLoaded", function() {
    loadTheme();
    updateThemeButton();
});
