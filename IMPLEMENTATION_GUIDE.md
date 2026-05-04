# Step-by-Step Implementation & Usage Guide

## 🎯 Complete Setup & First Run

### Part 1: Database Setup (15 minutes)

#### Step 1.1: Start MySQL Service

**Windows:**
```batch
# Open Command Prompt as Administrator
net start MySQL80
```

**Mac/Linux:**
```bash
mysql.server start
# or
brew services start mysql
```

#### Step 1.2: Create Database

**Option A: Using SQL File**
```bash
# Navigate to project directory
cd c:\Users\kings\Desktop\server1\PortfolioWebsite

# Run SQL file
mysql -u root -p < portfolio_db.sql
# Press Enter when prompted for password (if no password)
```

**Option B: Manual Method**
```bash
# Open MySQL Command Line
mysql -u root -p

# Copy-paste contents of portfolio_db.sql
# Or run: source C:\path\to\portfolio_db.sql
```

#### Step 1.3: Verify Database

```sql
mysql -u root -p
USE portfolio_db;
SHOW TABLES;

-- Should show: users, about, skills, projects, education, messages
SELECT * FROM users;  -- Should show ayush_raj
SELECT * FROM skills; -- Should show 4 skills
```

---

### Part 2: Java Environment Setup (10 minutes)

#### Step 2.1: Verify Java Installation

```bash
java -version
javac -version

# Output should show Java 11+
```

If not installed:
- Download from: https://www.oracle.com/java/technologies/downloads/
- Follow installation guide

#### Step 2.2: Set JAVA_HOME (Windows)

1. Find Java Installation Path (e.g., `C:\Program Files\Java\jdk-11.0.x`)
2. Open System Variables:
   - Right-click This PC → Properties
   - Advanced system settings
   - Environment Variables
   - New → Variable name: `JAVA_HOME`
   - Variable value: `C:\Program Files\Java\jdk-11.0.x`
3. Click OK and restart Command Prompt

Verify:
```bash
echo %JAVA_HOME%
```

---

### Part 3: Tomcat Setup (10 minutes)

#### Step 3.1: Download and Extract Tomcat

1. Download: https://tomcat.apache.org/download-90.cgi
2. Extract to: `C:\apache-tomcat-9.0.x`
3. Note the path

#### Step 3.2: Add MySQL JDBC Driver

1. Download: mysql-connector-java-8.0.33.jar
2. Copy to: `C:\apache-tomcat-9.0.x\lib\`

Verify it exists:
```bash
dir C:\apache-tomcat-9.0.x\lib\mysql-connector*
```

#### Step 3.3: Test Tomcat

1. Open Command Prompt
2. Navigate: `cd C:\apache-tomcat-9.0.x\bin`
3. Run: `startup.bat` (Windows) or `startup.sh` (Linux/Mac)
4. Open browser: http://localhost:8080
5. Should see Tomcat welcome page
6. Stop: `shutdown.bat` or `shutdown.sh`

---

### Part 4: Project Compilation (10 minutes)

#### Step 4.1: Update Database Credentials (if needed)

Edit: `PortfolioWebsite/src/com/portfolio/db/DBConnection.java`

```java
// Line 12-14
private static final String DB_URL = "jdbc:mysql://localhost:3306/portfolio_db";
private static final String DB_USER = "root";
private static final String DB_PASSWORD = ""; // Add password if you have one
```

#### Step 4.2: Compile Java Files (Windows)

1. Edit: `PortfolioWebsite/compile.bat`
   - Change Tomcat path: `SET TOMCAT_LIB=C:\apache-tomcat-9.0.x\lib`
   - Change MySQL JAR path if different

2. Double-click: `compile.bat`

3. Should see: "Compilation successful!"

**Verify:**
```bash
dir WebContent\WEB-INF\classes\com\portfolio\*
# Should show: db, model, dao, servlet, util folders
```

#### Step 4.2: Compile Java Files (Linux/Mac)

1. Edit: `PortfolioWebsite/compile.sh`
   - Update paths to your system

2. Make executable:
   ```bash
   chmod +x compile.sh
   ```

3. Run:
   ```bash
   ./compile.sh
   ```

---

### Part 5: Deploy to Tomcat (10 minutes)

#### Option A: Deploy Folder (Recommended for Development)

1. Copy `WebContent` folder to:
   ```
   C:\apache-tomcat-9.0.x\webapps\PortfolioWebsite\
   ```

2. Copy compiled classes:
   ```
   src/com/portfolio/**/*.class → 
   C:\apache-tomcat-9.0.x\webapps\PortfolioWebsite\WEB-INF\classes\com\portfolio\
   ```

3. Folder structure should look like:
   ```
   webapps/
   └─ PortfolioWebsite/
      ├─ css/
      ├─ js/
      ├─ WEB-INF/
      │  ├─ classes/
      │  │  └─ com/portfolio/**/*.class
      │  ├─ lib/
      │  └─ web.xml
      ├─ index.jsp
      ├─ register.jsp
      ├─ login.jsp
      ├─ dashboard.jsp
      └─ ... other JSP files
   ```

#### Option B: Create WAR File

1. Double-click: `createWar.bat` (Windows)
   - Creates: `PortfolioWebsite.war`

2. Copy `PortfolioWebsite.war` to:
   ```
   C:\apache-tomcat-9.0.x\webapps\
   ```

3. Start Tomcat - it will auto-extract WAR

---

### Part 6: Run Application (5 minutes)

#### Step 6.1: Start Services

```bash
# Terminal 1: Start MySQL
net start MySQL80

# Terminal 2: Start Tomcat
cd C:\apache-tomcat-9.0.x\bin
startup.bat

# Wait 5-10 seconds for startup
```

#### Step 6.2: Access Application

Open browser and visit:
```
http://localhost:8080/PortfolioWebsite
```

Should see **Home Page** with:
- Navigation bar with theme toggle
- Welcome section
- Featured projects
- Dark/Light mode working

#### Step 6.3: Test All Features

**1. Test Home Pages:**
- ✅ Click "About" → Should show about page
- ✅ Click "Skills" → Should show 4 skills from database
- ✅ Click "Projects" → Should show 2 projects from database
- ✅ Click "Education" → Should show 2 education records
- ✅ Click "Contact" → Should show contact form

**2. Test Dark Mode:**
- ✅ Click "🌙 Dark Mode" button
- ✅ Page should turn dark
- ✅ Refresh page - dark mode should persist (localStorage)
- ✅ Click "☀️ Light Mode" to switch back

**3. Test Contact Form:**
- ✅ Click "Contact" in navigation
- ✅ Try submitting empty form - should show validation error
- ✅ Enter name, invalid email (no @) - should show error
- ✅ Enter valid data - should submit successfully
- ✅ Check database: `SELECT * FROM messages;`

**4. Test Registration:**
- ✅ Click "Register" in navigation
- ✅ Try weak password (< 6 chars) - should show error
- ✅ Try mismatched passwords - should show error
- ✅ Register new user: `testuser / test@example.com / password123 / password123`
- ✅ Check database: `SELECT * FROM users;`

**5. Test Login:**
- ✅ Click "Login"
- ✅ Try wrong password - should show error
   - ✅ Login with: `ayush_raj / password123`
- ✅ Should redirect to **Dashboard**
- ✅ Navigation should show "Dashboard" and "Logout" links

**6. Test Dashboard CRUD:**

**Add Project:**
- ✅ In Dashboard, scroll to "My Projects"
- ✅ Enter project title: "My Web App"
- ✅ Enter description: "A web application"
- ✅ Enter technologies: "Java, JSP, MySQL"
- ✅ Click "Add Project"
- ✅ New project should appear in table below
- ✅ Check database: `SELECT * FROM projects WHERE user_id = 1;`

**Delete Project:**
- ✅ Click "Delete" button on any project
- ✅ Project should disappear from table
- ✅ Check database - record deleted

**Add Skill:**
- ✅ In Dashboard, scroll to "My Skills"
- ✅ Enter skill name: "Python"
- ✅ Select level: "Intermediate"
- ✅ Click "Add Skill"
- ✅ New skill appears with badge styling
- ✅ Check database: `SELECT * FROM skills WHERE user_id = 1;`

**Delete Skill:**
- ✅ Click "Delete" on any skill
- ✅ Skill disappears
- ✅ Database record deleted

**7. Test Logout:**
- ✅ Click "Logout" in navigation
- ✅ Should redirect to Home page
- ✅ Navigation should show "Login" and "Register" again
- ✅ Try accessing dashboard directly - should redirect to login

**8. Test Form Validations:**
- ✅ Contact form - empty fields
- ✅ Contact form - invalid email
- ✅ Register form - weak password
- ✅ Register form - password mismatch
- ✅ Login form - empty fields

---

## 🔍 Troubleshooting During Testing

### Issue: "Cannot connect to database"

**Solution:**
```bash
# Check MySQL is running
net start MySQL80  # Windows
mysql.server status  # Mac

# Verify credentials in DBConnection.java
# Test connection directly:
mysql -u root -p portfolio_db
```

### Issue: "JSP shows as plain text"

**Solution:**
```bash
# Verify files in correct location
# Java files compiled to: WebContent/WEB-INF/classes/
# Check: File → Download

# Restart Tomcat completely
shutdown.bat
timeout /t 5
startup.bat
```

### Issue: "404 Page not found"

**Solution:**
```bash
# Check deployment folder structure
dir C:\apache-tomcat-9.0.x\webapps\PortfolioWebsite\

# Should contain: css, js, WEB-INF, *.jsp files

# Try: http://localhost:8080/PortfolioWebsite/index.jsp
```

### Issue: "Class not found: com.portfolio.db.DBConnection"

**Solution:**
```bash
# Recompile Java files
compile.bat

# Verify compiled files exist
dir WebContent\WEB-INF\classes\com\portfolio\db\
# Should show: DBConnection.class
```

---

## 📊 Database Testing Queries

Use these queries to verify data:

```sql
-- Check users table
SELECT * FROM users;

-- Check if ayush_raj exists
SELECT * FROM users WHERE username = 'ayush_raj';

-- Check user's skills
SELECT * FROM skills WHERE user_id = 1;

-- Check user's projects
SELECT * FROM projects WHERE user_id = 1;

-- Check contact messages
SELECT * FROM messages ORDER BY received_at DESC;

-- Check total records
SELECT 'users' as table_name, COUNT(*) as count FROM users
UNION
SELECT 'skills', COUNT(*) FROM skills
UNION
SELECT 'projects', COUNT(*) FROM projects
UNION
SELECT 'education', COUNT(*) FROM education
UNION
SELECT 'messages', COUNT(*) FROM messages;
```

---

## 🎓 Code Examples to Learn From

### Example 1: How Registration Works

**File: register.jsp**
```html
<form method="post" action="RegisterServlet" onsubmit="return validateRegisterForm()">
    <!-- validateRegisterForm() from validation.js checks fields -->
    <!-- Form data POSTs to RegisterServlet -->
</form>
```

**File: RegisterServlet.java**
```java
protected void doPost(...) {
    String username = request.getParameter("username");
    // Server-side validation
    User user = new User();
    user.setPassword(PasswordUtil.hashPassword(password)); // SHA-256
    UserDAO.registerUser(user); // Calls DAO
}
```

**File: UserDAO.java**
```java
public static boolean registerUser(User user) {
    String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
    PreparedStatement pst = conn.prepareStatement(sql);
    pst.setString(1, user.getUsername()); // Prevents SQL injection
    // Execute and return success/failure
}
```

### Example 2: How Dashboard CRUD Works

**User adds project:**
1. Dashboard.jsp → Add Project Form
2. ProjectServlet receives POST with action="add"
3. ProjectDAO.addProject() executes INSERT
4. Servlet forwards back to dashboard.jsp with success message
5. Database shows new project
6. JSP displays all projects via ProjectDAO.getProjectsByUser()

### Example 3: How Security Works

**Password Flow:**
```
Plain Password → PasswordUtil.hashPassword() → SHA-256 Hash
Stored in DB → PasswordUtil.verifyPassword() → Match on Login
```

**Session Flow:**
```
Login → HttpSession.setAttribute("userId", ...) 
→ Dashboard checks if userId exists
→ If null → Redirect to login.jsp
→ Logout → session.invalidate() → Clears all attributes
```

---

## ✅ Verification Checklist

Before moving to production:

- [ ] Database created with all tables
-- [ ] Sample data inserted (ayush_raj user)
- [ ] Java files compiled successfully
- [ ] No compilation errors
- [ ] All JSP pages accessible
- [ ] Styling works (CSS loads)
- [ ] JavaScript validation works
- [ ] Dark mode toggle works
- [ ] Database connections working
- [ ] User registration works
- [ ] User login works
- [ ] Dashboard CRUD works
- [ ] Logout works
- [ ] Contact form saves messages
- [ ] No errors in Tomcat console

---

## 🚀 Next Steps After Setup

1. **Create your own account** instead of using demo account
2. **Add your real projects** in dashboard
3. **Modify styling** in style.css to match your brand
4. **Update content** in JSP pages with your information
5. **Add more features** (blog, portfolio filters, etc.)
6. **Deploy to cloud** (AWS, Heroku, Azure)
7. **Add email notifications** for contact form
8. **Implement REST API** for frontend framework integration

---

**Congratulations! You now have a fully functional Java Full-Stack Portfolio Website!** 🎉

