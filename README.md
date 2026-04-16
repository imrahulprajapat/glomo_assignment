# 🏦 Simplified Banking System (Rails API)

## 📌 Overview

This is a simplified banking system built using Ruby on Rails (API-only mode).
It supports basic operations like user authentication, checking account balance, and depositing funds.

The system is designed with clean separation of concerns and extensibility in mind.

---

## 🚀 Features Implemented

* **Login** — Authenticate user using email and PIN
* **Balance** — Retrieve current balance and locked balance
* **Deposit** — Add funds to a user’s account

---

## 🧱 Tech Stack

* Ruby on Rails (API mode)
* SQLite (default database)
* ActiveRecord (ORM)

---

## 🏗️ System Design

### Models

* **User**

  * Stores authentication data (email, PIN)
  * Has one account

* **Account**

  * Stores financial data (balance, locked_balance)
  * Has many transactions

* **Transaction (STI)**

  * Base model for all transactions
  * Uses Single Table Inheritance (STI)
  * Current implementation:

    * `Deposit` (handles deposit logic)

### Key Design Decisions

* **Separation of User and Account**

  * Keeps authentication and financial data independent

* **Use of STI for Transactions**

  * Enables easy extension for future transaction types (e.g., withdrawal)

* **Database Transactions + Row Locking**

  * Ensures atomic updates and prevents race conditions during balance updates

---

## ⚙️ Setup Instructions

```bash
git clone <your-repo-url>
cd glomo_assignment

bundle install

rails db:create
rails db:migrate
rails db:seed

rails server
```

Server will start at:
`http://localhost:3000`

---

## 🌱 Seeded Users

| Name  | Email                                         | PIN  | Balance |
| ----- | --------------------------------------------- | ---- | ------- |
| Alice | [alice@example.com](mailto:alice@example.com) | 1234 | 1000    |
| Bob   | [bob@example.com](mailto:bob@example.com)     | 5678 | 500     |

---

## 🔌 API Endpoints

### 1. Login

**POST** `/login`

```json
{
  "email": "alice@example.com",
  "pin": "1234"
}
```

---

### 2. Get Balance

**GET** `/balance/:user_id`

---

### 3. Deposit

**POST** `/transactions/:user_id`

```json
{
  "amount": 200
}
```

---

## 🧪 How to Test (cURL)

### Login

```bash
curl -X POST http://localhost:3000/login \
  -H "Content-Type: application/json" \
  -d '{"email":"alice@example.com","pin":"1234"}'
```

### Balance

```bash
curl http://localhost:3000/balance/1
```

### Deposit

```bash
curl -X POST http://localhost:3000/transactions/1 \
  -H "Content-Type: application/json" \
  -d '{"amount":200}'
```

---

## ⚠️ Error Handling

The API handles:

* Invalid email or PIN → `401 Unauthorized`
* Negative or zero deposit → `422 Unprocessable Entity`
* User not found → `404 Not Found`
* Unexpected errors → `422 Unprocessable Entity`

---

## 🤔 Assumptions

* PIN is stored as plain text (for simplicity in this assignment)
* Only deposit functionality is implemented (as required)
* No authentication token/session is used
* Single account per user

---

## 🧠 Notes

The focus of this implementation was:

* Clean and maintainable code
* Proper domain modeling
* Simplicity while keeping extensibility in mind

---
