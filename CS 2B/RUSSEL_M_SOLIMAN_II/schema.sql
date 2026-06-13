-- Table structures (CREATE statements)
-- Copy-paste, and run manually in phpMyAdmin, in SQL tab

CREATE DATABASE IF NOT EXISTS dingle_plaza_mart;
USE dingle_plaza_mart

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Role ENUM('admin','cashier','inventory') NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PinCodeHash VARCHAR(255) NOT NULL,
    IsActive BOOLEAN DEFAULT FALSE
);

-- Create attendance_shifts table, refs to users
CREATE TABLE IF NOT EXISTS attendance_shifts (
    ShiftID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    Time_In DATETIME NOT NULL,
    StartingCash DECIMAL(10,2),
    Time_Out DATETIME,
    EndingCash DECIMAL(10,2),
    TotalSales DECIMAL(10,2),

    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

-- Create transactions table, refs to attendance_shifts
CREATE TABLE IF NOT EXISTS transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    TransactionNo VARCHAR(70) NOT NULL,
    ShiftID INT NOT NULL,
    TransactionDate DATETIME NOT NULL DEFAULT NOW(),
    TotalAmount DECIMAL(10,2) NOT NULL,
    PaymentMethod ENUM('Cash', 'GCash') NOT NULL,
    AmountRecieved DECIMAL(10,2) NOT NULL,
    ChangeAmount DECIMAL(10,2) NOT NULL,
    ReferenceNumber VARCHAR(100),

    FOREIGN KEY (ShiftID) REFERENCES attendance_shifts(ShiftID)
);

-- Create Categories table
CREATE TABLE IF NOT EXISTS categories (
  CategoryID INT AUTO_INCREMENT PRIMARY KEY,
  CategoryName VARCHAR(100) NOT NULL,
  Description VARCHAR(255)
);

-- Create Products table, refs to Category
CREATE TABLE IF NOT EXISTS products (
  ProductID INT AUTO_INCREMENT PRIMARY KEY,
  ProductNumber VARCHAR(50) NOT NULL,
  Name VARCHAR(100) NOT NULL,
  CategoryID INT NOT NULL,
  BasePrice DECIMAL(10,2) NOT NULL,
  MarkupPrice DECIMAL(10,2) NOT NULL,
  StockQty INT DEFAULT 0,
  ExpiryDate DATE,
  IsDeleted BOOLEAN DEFAULT FALSE,
  DeleteReason VARCHAR(255),

  FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);

-- Create transaction items, refs to transactions and products
CREATE TABLE IF NOT EXISTS transaction_items (
  ItemID INT AUTO_INCREMENT PRIMARY KEY,
  TransactionID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  PriceAtSale DECIMAL(10,2) NOT NULL,

  FOREIGN KEY (TransactionID) REFERENCES transactions(TransactionID),
  FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

-- Create inventory_logs table, refs to products and users
CREATE TABLE inventory_logs (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  ProductID INT NOT NULL,
  UserID INT NOT NULL,
  Action ENUM('Add', 'Edit', 'Restock') NOT NULL,
  QuantityChange INT NOT NULL,
  Remarks VARCHAR(255),
  LogDate DATETIME NOT NULL DEFAULT NOW(),

  FOREIGN KEY (ProductID) REFERENCES products(ProductID),
  FOREIGN KEY (UserID) REFERENCES users(UserID)
);

-- Create notifs table, refs to products and users
CREATE TABLE IF NOT EXISTS notifications (
  NotificationID INT AUTO_INCREMENT PRIMARY KEY,
  Type ENUM('Stock', 'Attendance') NOT NULL,
  Message VARCHAR(255) NOT NULL,
  RelatedProductID INT,
  RelatedUserID INT,
  IsRead BOOLEAN DEFAULT FALSE,
  CreatedAt DATETIME NOT NULL DEFAULT NOW(),
  
  FOREIGN KEY (RelatedProductID) REFERENCES products(ProductID),
  FOREIGN KEY (RelatedUserID) REFERENCES users(UserID)
);