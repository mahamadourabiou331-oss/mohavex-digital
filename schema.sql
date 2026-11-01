CREATE DATABASE IF NOT EXISTS mohavex_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mohavex_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    member_id VARCHAR(50) UNIQUE NOT NULL,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    country VARCHAR(50) NOT NULL,
    balance_fcfa DECIMAL(12,2) DEFAULT 0.00,
    balance_usdt DECIMAL(12,2) DEFAULT 0.00,
    status ENUM('pending', 'active', 'suspended') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    reward_fcfa DECIMAL(10,2) NOT NULL,
    deadline DATE NOT NULL,
    status ENUM('active', 'completed', 'expired') DEFAULT 'active'
);

CREATE TABLE affiliate_products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price_fcfa DECIMAL(10,2),
    affiliate_link VARCHAR(500) NOT NULL,
    commission_rate DECIMAL(5,2) DEFAULT 5.00
);
