# Dynamic Portfolio Website - Java Full Stack

A beginner-friendly dynamic portfolio website project using **Java**, **JSP**, **Servlets**, and **MySQL**.

---

## **Deployment (Split approach)**

This project uses a Java/Tomcat backend and static JSP/HTML frontend. Vercel hosts static sites only, so the recommended approach is:

- Deploy the frontend (static files) to **Vercel**.
- Deploy the Java/Tomcat backend as a Docker container to a provider such as **Render**, **Railway**, or **DigitalOcean**.

Quick steps to deploy frontend to Vercel:

1. In Vercel, create a new project and point it to this repository (or a separate frontend-only repo).
2. Set the **Root Directory** to `WebContent` so Vercel serves the static files from there.
3. Build settings: none required for plain HTML/JSP static files — Vercel will serve the files directly.
4. If you want `index.jsp` to render as static HTML, rename it to `index.html` or pre-render the content. (JSP requires a Java server; static hosting will serve the raw JSP file unless pre-rendered.)

Note: If you need true JSP rendering, host the backend (Tomcat) and point Vercel frontend to the backend API endpoints.

Docker / Render / Local compose (backend):

1. Build and run locally with Docker Compose (requires Docker):

```bash
docker-compose build --no-cache
docker-compose up
```

2. The backend will be available at `http://localhost:8080` and MySQL at `localhost:3306`.

3. To deploy to a container host (Render, Railway), push the repository and configure a service to build the Dockerfile in the repo. Set environment variables `DB_URL`, `DB_USER`, and `DB_PASSWORD` on the host as needed.

4. The `docker-compose.yml` included sets the internal DB URL to `jdbc:mysql://db:3306/portfolio_db`; the `DBConnection` class reads `DB_URL`, `DB_USER`, `DB_PASSWORD` from environment variables.

Important: Vercel can host the static assets (images, CSS, JS). If you want pages rendered server-side (JSP), keep the backend deployed where Tomcat runs.

## Project Overview

This is a complete full-stack application where users can:
- Create an account (Register/Login)
- Manage their portfolio data (Projects, Skills, Education)
- View and manage their dashboard
- Send contact messages
- Toggle between Dark and Light mode

## Technologies Used

- **Backend**: Java, Servlets, JSP
- **Database**: MySQL
- **Frontend**: HTML5, CSS3 (Flexbox), JavaScript (Vanilla)
- **Server**: Apache Tomcat 9+
- **JDBC**: For database connectivity

## Project Structure

```
PortfolioWebsite/
├── src/
│   └── com/portfolio/
│       ├── db/
│       │   └── DBConnection.java
│       ├── model/
│       │   ├── User.java
│       │   ├── Skill.java
│       │   ├── Project.java
│       │   ├── Education.java
│       │   └── Message.java
│       ├── dao/
│       │   ├── UserDAO.java
│       │   ├── SkillDAO.java
│       │   ├── ProjectDAO.java
│       │   ├── EducationDAO.java
│       │   └── MessageDAO.java
│       ├── servlet/
│       │   ├── RegisterServlet.java
│       │   ├── LoginServlet.java
│       │   ├── LogoutServlet.java
│       │   ├── ProjectServlet.java
│       │   ├── SkillServlet.java
│       │   └── ContactServlet.java
│       └── util/
│           └── PasswordUtil.java
├── WebContent/
│   ├── WEB-INF/
│   │   └── web.xml
│   ├── css/
│   │   └── style.css
│   ├── js/
│   │   ├── validation.js
│   │   └── theme.js
│   ├── index.jsp
│   ├── about.jsp
│   ├── skills.jsp
│   ├── projects.jsp
│   ├── education.jsp
│   ├── contact.jsp
│   ├── register.jsp
│   ├── login.jsp
│   ├── dashboard.jsp
│   ├── header.jsp
│   └── footer.jsp
└── portfolio_db.sql
```

## Installation & Setup

### Step 1: Prerequisites

1. **Java Development Kit (JDK)** - Download and install JDK 11 or higher
   - Download from: https://www.oracle.com/java/technologies/downloads/
   - Set JAVA_HOME environment variable

2. **Apache Tomcat 9** or higher
   - Download from: https://tomcat.apache.org/download-90.cgi
   - Extract to a folder (e.g., C:\apache-tomcat-9.0.x)

3. **MySQL Server**

---

## Push to your GitHub repo

Use the helper scripts included to push this project to `https://github.com/sumitkumar1008/dynamicportfolio.git`.

Windows PowerShell (run in project root):

```powershell
.\push_to_github.ps1 https://github.com/sumitkumar1008/dynamicportfolio.git main
```

Unix / Git Bash:

```bash
./push_to_github.sh https://github.com/sumitkumar1008/dynamicportfolio.git main
```

Notes:
- The scripts initialize git if needed, add the remote, commit (if there are staged changes), and push to the `main` branch.
- If your GitHub repo requires credentials, configure SSH or use a personal access token when specifying the remote URL.
- After pushing, the GitHub Actions workflow `Compile Java Sources` will run to verify Java compilation.

   - Download from: https://dev.mysql.com/downloads/mysql/
   - Install and start MySQL service

4. **MySQL JDBC Driver**
   - Download: mysql-connector-java-8.0.33.jar
   - Place in `Tomcat/lib/` folder

### Step 2: Create Database

1. Open MySQL Command Line or MySQL Workbench
2. Run the SQL file:
   ```bash
   mysql -u root -p < portfolio_db.sql
   ```
   (When prompted for password, press Enter if no password, or enter your MySQL password)

3. Verify database creation:
   ```sql
   USE portfolio_db;
   SHOW TABLES;
   ```

### Step 3: Configure Database Connection

1. Edit `src/com/portfolio/db/DBConnection.java`
2. Update database credentials if needed:
   ```java
   private static final String DB_URL = "jdbc:mysql://localhost:3306/portfolio_db";
   private static final String DB_USER = "root";
   private static final String DB_PASSWORD = ""; // Your MySQL password
   ```

### Step 4: Create WAR File

1. Open Command Prompt in the project directory
2. Compile Java files:
   ```bash
   javac -d WebContent/WEB-INF/classes -cp WebContent/WEB-INF/lib/* src/com/portfolio/**/*.java
   ```

3. Create WAR file:
   ```bash
   jar cf PortfolioWebsite.war -C WebContent .
   ```

### Step 5: Deploy on Tomcat

**Option A: Using WAR File**
1. Copy `PortfolioWebsite.war` to `Tomcat/webapps/` folder
2. Start Tomcat (double-click `startup.bat` on Windows or `startup.sh` on Linux/Mac)
3. Access the application: http://localhost:8080/PortfolioWebsite

**Option B: Direct Folder Deployment**
1. Copy the entire `WebContent` folder to `Tomcat/webapps/PortfolioWebsite/`
2. Create folder: `Tomcat/webapps/PortfolioWebsite/WEB-INF/classes/`
3. Compile Java files into `classes/` folder
4. Start Tomcat
5. Access: http://localhost:8080/PortfolioWebsite

### Step 6: Add MySQL JDBC Driver

1. Download: mysql-connector-java-8.0.33.jar
2. Copy to: `Tomcat/lib/`
3. Also copy to: `PortfolioWebsite/WEB-INF/lib/`

## Database Setup

The `portfolio_db.sql` file creates:
- **users** table - User login credentials
- **about** table - User bio/description
- **skills** table - User skills with proficiency levels
- **projects** table - User portfolio projects
- **education** table - User education details
- **messages** table - Contact form messages

### Sample Login Credentials
- **Username**: ayush_raj
- **Password**: password123

## Features

### Frontend (Module 1)
- Home page (index.jsp)
- About page (about.jsp)
- Skills page (skills.jsp)
- Projects page (projects.jsp)
- Education page (education.jsp)
- Contact page (contact.jsp)
- Responsive design using Flexbox

### JavaScript (Module 2)
- Form validation (Contact, Register, Login)
- Dark/Light mode toggle with localStorage persistence

### Database (Module 3)
- 6 tables with proper relationships
- Sample data included

### JDBC (Module 4)
- DBConnection class for connection pooling
- PreparedStatement for SQL injection prevention

### Authentication (Module 5)
- User registration with validation
- Secure login with SHA-256 password hashing
- Session management
- Logout functionality

### Dashboard CRUD (Module 6)
- Add/Edit/Delete Projects
- Add/Delete Skills
- Simple, intuitive UI

### Dynamic Data (Module 7)
- Fetch data from database
- Display using JSP loops

### Security (Module 8)
- Session-based authentication
- SHA-256 password hashing
- Input validation
- SQL injection prevention with PreparedStatement

## Testing the Application

1. **Home Page**: Navigate to http://localhost:8080/PortfolioWebsite
2. **Register**: Create new account
3. **Login**: Use credentials or sample login
4. **Dashboard**: Add projects and skills
5. **View Portfolio**: See updated public pages
6. **Contact**: Send messages
7. **Dark Mode**: Click theme toggle button

## Common Issues & Solutions

### Issue: Database connection failed
- **Solution**: Check MySQL is running, verify credentials in DBConnection.java

### Issue: 404 error
- **Solution**: Check Tomcat webapps folder, verify WAR file is deployed

### Issue: JSP not loading
- **Solution**: Ensure Java files are compiled in WEB-INF/classes/, restart Tomcat

### Issue: Styles not loading
- **Solution**: Check CSS file path in JSP, verify CSS is in WebContent/css/

### Issue: Form submission gives error
- **Solution**: Verify MySQL JDBC driver is in Tomcat/lib/

## Code Comments

All Java files are well-commented for beginners to understand:
- Database operations explanation
- Security implementation
- Session management
- CRUD operations

## Learning Outcomes

After completing this project, you'll understand:
- ✅ How to create a Java web application from scratch
- ✅ Servlet lifecycle and request/response handling
- ✅ JSP templating and dynamic content
- ✅ Database connectivity with JDBC
- ✅ SQL operations (CRUD)
- ✅ User authentication and session management
- ✅ Password encryption basics
- ✅ Form validation (client and server-side)
- ✅ Responsive web design with Flexbox
- ✅ MVC pattern implementation

## Next Steps

To enhance this project:
1. Add edit functionality for projects
2. Implement pagination for large data
3. Add image upload for projects
4. Create admin panel
5. Add email notifications
6. Deploy on cloud (AWS, Heroku)
7. Add REST APIs

## Resources

- [Apache Tomcat Docs](https://tomcat.apache.org/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [Java Servlets Documentation](https://docs.oracle.com/javaee/7/api/javax/servlet/package-summary.html)
- [JSP Documentation](https://projects.eclipse.org/projects/ee4j.jsp)

## License

This project is free to use for educational purposes.

---

**Happy Learning! 🚀**
