# Quick Start Guide for Portfolio Website

## 5-Minute Quick Start

### Prerequisites Installed?
- ✅ JDK 11+
- ✅ Tomcat 9+
- ✅ MySQL
- ✅ MySQL JDBC Driver (in Tomcat/lib/)

### Steps:

1. **Create Database**
   ```bash
   mysql -u root -p < portfolio_db.sql
   ```

2. **Verify MySQL Connection**
   - Update DB credentials in `DBConnection.java` if needed

3. **Compile Java Files**
   ```bash
   javac -d WebContent/WEB-INF/classes -cp WebContent/WEB-INF/lib/* src/com/portfolio/**/*.java
   ```

4. **Deploy to Tomcat**
   - Copy WebContent folder to `Tomcat/webapps/PortfolioWebsite/`
   - Or create WAR and copy to `Tomcat/webapps/`

5. **Start Tomcat**
   - Windows: `Tomcat/bin/startup.bat`
   - Linux/Mac: `Tomcat/bin/startup.sh`

6. **Access Application**
   - Open browser: http://localhost:8080/PortfolioWebsite

### Default Login
### Default Login
- Username: `ayush_raj`
- Password: `password123`

## Troubleshooting

| Error | Solution |
|-------|----------|
| "Database connection failed" | Check MySQL is running, verify DB credentials |
| "Cannot find symbol" | Compile with proper classpath, check jar files |
| "JSP shows source code" | Restart Tomcat, check Java files are compiled |
| "404 Not Found" | Check Tomcat webapps folder, verify deployment path |
| "Class not found: DBConnection" | Compile Java files to WEB-INF/classes/ |

## Common MySQL Commands

```bash
# Start MySQL service
mysql -u root -p

# Create database
CREATE DATABASE portfolio_db;

# Use database
USE portfolio_db;

# Show tables
SHOW TABLES;

# View users
SELECT * FROM users;
```

## File Locations to Remember

- **Web Files**: `WebContent/`
- **Java Source**: `src/com/portfolio/`
- **Compiled Classes**: `WebContent/WEB-INF/classes/`
- **Lib Folder**: `WebContent/WEB-INF/lib/`
- **Configuration**: `WebContent/WEB-INF/web.xml`

## Next Time You Start

1. Start MySQL: `net start MySQL80` (Windows) or `mysql.server start` (Mac)
2. Start Tomcat: `Tomcat/bin/startup.bat` or `startup.sh`
3. Open: http://localhost:8080/PortfolioWebsite
4. Stop Tomcat: `Tomcat/bin/shutdown.bat` or `shutdown.sh`

---

**Need Help?** Check the main README.md file for detailed documentation.
