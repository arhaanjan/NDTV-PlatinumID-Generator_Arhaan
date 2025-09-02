# Platinum ID Generator – NDTV

## 📌 Overview
The **Platinum ID Generator** is a sponsor identity management system developed during my internship at **NDTV (Jul 2025, 1 month)**.  
It issues **unique Platinum IDs** to sponsors, provides **role-based access control (Admin/Sponsor)**, and features a **centralized dashboard** for managing sponsorship data with filtering and status tracking.  

---

## 🔧 Prerequisites
- Visual Studio (2019 or later)  
- .NET Framework 4.7+ (for ASP.NET Web Forms)  
- SQL Server (Express/Developer edition)  
- SQL Server Management Studio (SSMS) – optional, for DB management  

---

## 🚀 Features
- **Sponsor Onboarding & Platinum ID Generation**
  - Unique IDs assigned at signup  
  - Linked to sponsor profile (Name, EmpId, Status)  

- **Role-Based Access Control**
  - **Admin:** Add, edit, and approve sponsors  
  - **Sponsor (User):** Restricted access to view own details  

- **Sponsor Dashboard**
  - Real-time sponsor list in GridView  
  - Advanced filtering by **State, Type, Status**  
  - Inline editing and instant DB updates  

- **Status Tracking**
  - Sponsors marked as **Active/Inactive** with visual highlights  

- **Database Security**
  - Parameterized SQL queries prevent injection  
  - Role-based restrictions enforced  

---

## 🏆 Business Impact
- Improved **sponsor transparency** with clear Active/Inactive status    
- Delivered a **digital-first sponsorship system** for NDTV  

---

## 🛠 Tech Stack
- ASP.NET Web Forms (C#)  
- SQL Server  
- ADO.NET  
- GridView Controls  

---

## ⚙️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/NDTV-PlatinumID-Generator.git
```
### 2. Database Setup
Run the following script in SQL Server Management Studio (SSMS):
```sql
-- Create Database
CREATE DATABASE PlatinumID_DB;
GO
USE PlatinumID_DB;
GO

-- ============================
-- 1. Accounts Table
-- Stores login/signup details for Admins and Sponsors
-- ============================
CREATE TABLE Accounts (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    EmpId NVARCHAR(50) NOT NULL,
    Role NVARCHAR(20) NOT NULL DEFAULT 'user'
);

-- Insert default Admin account
INSERT INTO Accounts (Username, Password, EmpId, Role)
VALUES ('admin', 'admin123', 'EMP001', 'admin');
GO

-- ============================
-- 2. Data Table
-- Stores Sponsor details linked to Platinum IDs
-- ============================
CREATE TABLE Data (
    Sno INT IDENTITY(1,1) PRIMARY KEY,
    Sname NVARCHAR(100) NOT NULL,       -- Sponsor Name
    PlatinumID NVARCHAR(50) NOT NULL,   -- Unique Sponsor ID
    State NVARCHAR(100) NULL,           -- Sponsor Location
    Type NVARCHAR(100) NULL,            -- Sponsor Type (Gold/Silver/Platinum etc.)
    Status NVARCHAR(20) NOT NULL DEFAULT 'Inactive'  -- Active/Inactive
);

-- Insert sample sponsor records
INSERT INTO Data (Sname, PlatinumID, State, Type, Status)
VALUES 
('Sponsor A', 'PID1001', 'Delhi', 'Gold', 'Active'),
('Sponsor B', 'PID1002', 'Mumbai', 'Silver', 'Inactive');
GO
```
### 3. Configure Connection String
Edit Web.config → replace with your SQL Server connection string:
```xml
<connectionStrings>
  <add name="FormDBConnection" 
       connectionString="Data Source=.;Initial Catalog=PlatinumID_DB;Integrated Security=True" 
       providerName="System.Data.SqlClient"/>
</connectionStrings>
```
### 4. Run the Project

- Open the solution in Visual Studio

- Build the project

- Press F5 to run locally in the browser
