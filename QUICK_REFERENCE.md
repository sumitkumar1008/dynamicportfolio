# 🚀 Quick Reference Card

## **COMMANDS**

### Start Services
```bash
# MySQL
net start MySQL80          # Windows
mysql.server start         # Mac

# Tomcat
cd Tomcat/bin
startup.bat               # Windows
./startup.sh              # Linux/Mac
```

### Stop Services
```bash
# Tomcat
shutdown.bat              # Windows
./shutdown.sh             # Linux/Mac

# MySQL
net stop MySQL80          # Windows
mysql.server stop         # Mac
```

### Compile Project
```bash
# Windows
compile.bat

# Linux/Mac
chmod +x compile.sh
./compile.sh
```

### Create WAR File
```bash
createWar.bat            # Windows
# Then copy PortfolioWebsite.war to Tomcat/webapps/
```

---

## **URLs**

| Page | URL |
|------|-----|
| Home | http://localhost:8080/PortfolioWebsite |
| About | http://localhost:8080/PortfolioWebsite/about.jsp |
| Skills | http://localhost:8080/PortfolioWebsite/skills.jsp |
| Projects | http://localhost:8080/PortfolioWebsite/projects.jsp |
| Education | http://localhost:8080/PortfolioWebsite/education.jsp |
| Contact | http://localhost:8080/PortfolioWebsite/contact.jsp |
| Register | http://localhost:8080/PortfolioWebsite/register.jsp |
| Login | http://localhost:8080/PortfolioWebsite/login.jsp |
| Dashboard | http://localhost:8080/PortfolioWebsite/dashboard.jsp |
| Tomcat Admin | http://localhost:8080 |

---

## **DATABASE**

### Connect to MySQL
```bash
mysql -u root -p
USE portfolio_db;
```

### Useful Queries
```sql
-- Show all users
SELECT * FROM users;

-- Show all skills for user 1
SELECT * FROM skills WHERE user_id = 1;

-- Show all projects for user 1
SELECT * FROM projects WHERE user_id = 1;

-- Show all contact messages
SELECT * FROM messages ORDER BY received_at DESC;

-- Delete all test data (START FRESH)
DELETE FROM messages;
DELETE FROM projects;
DELETE FROM skills;
DELETE FROM education;
DELETE FROM about;
DELETE FROM users;

-- Reset database
DROP DATABASE portfolio_db;
-- Then run: mysql -u root -p < portfolio_db.sql
```

---

## **DEFAULT LOGIN**

| Field | Value |
|-------|-------|
| Username | ayush_raj |
| Password | password123 |
| Email | ayush123@gmail.com |

---

## **FILE PATHS**

| Item | Path |
|------|------|
| Source Code | `src/com/portfolio/` |
| JSP Pages | `WebContent/` |
| CSS | `WebContent/css/style.css` |
| JavaScript | `WebContent/js/` |
| Compiled Classes | `WebContent/WEB-INF/classes/` |
| Configuration | `WebContent/WEB-INF/web.xml` |
| Database Script | `portfolio_db.sql` |

---

## **FOLDER STRUCTURE**

```
PortfolioWebsite/
├── src/                          # Source code
│   └── com/portfolio/
│       ├── db/       → DBConnection.java
│       ├── model/    → User, Skill, Project, etc.
│       ├── dao/      → UserDAO, SkillDAO, ProjectDAO, etc.
│       ├── servlet/  → LoginServlet, ProjectServlet, etc.
│       └── util/     → PasswordUtil.java
│
├── WebContent/                   # Web files
│   ├── css/          → style.css
│   ├── js/           → validation.js, theme.js
│   ├── WEB-INF/      → web.xml, classes/, lib/
│   └── *.jsp         → All JSP pages
│
├── portfolio_db.sql              # Database creation
├── README.md                     # Full documentation
├── QUICKSTART.md                 # 5-min setup
└── compile.bat                   # Compilation script
```

---

## **COMMON EDITS**

### Add Database Credentials
File: `src/com/portfolio/db/DBConnection.java` (Lines 12-14)
```java
private static final String DB_PASSWORD = "your_password";
```

### Add Navigation Link
File: `WebContent/header.jsp` (In navbar-links)
```html
<li><a href="yourpage.jsp">New Page</a></li>
```

### Change Styling
File: `WebContent/css/style.css`
- Search for color codes: `#007bff`, `#333`, etc.
- Modify font-size, padding, etc.

### Add Form Validation
File: `WebContent/js/validation.js`
```javascript
function validateYourForm() {
    const field = document.getElementById("fieldId").value;
    if (field === "") {
        alert("Field is required!");
        return false;
    }
    return true;
}
```

---

## **ERROR FIXES**

| Error | Fix |
|-------|-----|
| "Database connection failed" | Check MySQL running, update DB credentials |
| "Cannot find class" | Recompile: `compile.bat` |
| "JSP shows source code" | Restart Tomcat |
| "404 Not Found" | Check deployment folder, verify path |
| "Style not loading" | Clear browser cache, check CSS path |
| "Validation not working" | Check JavaScript console for errors |
| "Login fails" | Verify user exists: `SELECT * FROM users;` |
| "Cannot create new project" | Check user is logged in (session exists) |

---

## **DATABASE TABLES**

```sql
-- users: id, username, email, password
-- skills: id, user_id, name, level
-- projects: id, user_id, title, description, tech_stack
-- education: id, user_id, degree, college, graduation_year
-- messages: id, name, email, message, received_at
-- about: id, user_id, description
```

---

## **KEY JAVA CLASSES**

| Class | Purpose |
|-------|---------|
| DBConnection | Database connectivity |
| UserDAO | Login/Register operations |
| SkillDAO | Skill CRUD |
| ProjectDAO | Project CRUD |
| *Servlet | HTTP request handling |
| PasswordUtil | Password hashing |

---

## **CHECKLIST FOR FIRST RUN**

- [ ] MySQL installed and running
- [ ] JDK installed (java -version)
- [ ] Tomcat installed
- [ ] MySQL JDBC in Tomcat/lib/
- [ ] Database created (portfolio_db.sql)
- [ ] Java files compiled
- [ ] Files in Tomcat/webapps/
- [ ] Tomcat started
- [ ] Browser: http://localhost:8080/PortfolioWebsite
- [ ] Home page loads
- [ ] Can register new user
- [ ] Can login
- [ ] Can add project/skill

---

## **DEPLOYMENT CHECKLIST**

For production deployment:

- [ ] Update DB credentials (DBConnection.java)
- [ ] Change default login credentials
- [ ] Update email in database
- [ ] Replace sample projects/skills with real data
- [ ] Verify all links work
- [ ] Test on different browsers
- [ ] Test responsive design (mobile)
- [ ] Run security review
- [ ] Set up SSL/HTTPS
- [ ] Configure backups
- [ ] Document deployment steps

---

## **PERFORMANCE TIPS**

```java
// Use PreparedStatement (Already Done ✓)
// Connection pooling considerations
// Implement caching for frequently accessed data
// Optimize database queries with proper indexing
```

---

## **EXTENSIONS TO TRY**

1. **Add blog module** → BlogDAO, BlogServlet, blog.jsp
2. **Add resume/CV** → File upload functionality
3. **Add testimonials** → Database table + CRUD
4. **Add work experience** → Experience table + display
5. **Add search** → Filter skills/projects
6. **Add comments** → On projects
7. **Add admin panel** → View all users, messages
8. **Add email** → JavaMail for contact form

---

**📌 PIN THIS FILE FOR QUICK REFERENCE!**

**Last Updated**: 2024
**Version**: 1.0
**Status**: Production Ready ✅

