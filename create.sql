CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    customer_id INT UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL CHECK (email LIKE '%@%.%'),
    phone_number VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(255) UNIQUE NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
);

CREATE TABLE Billing_Cycles (
    billing_cycle_id INT PRIMARY KEY,
    cycle_name VARCHAR(20) UNIQUE NOT NULL CHECK (cycle_name IN ('Monthly', 'Yearly'))
);

CREATE TABLE Subscription_Status (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(20) UNIQUE NOT NULL CHECK (status_name IN ('Active', 'Paused', 'Canceled'))
);

CREATE TABLE Payment_Methods (
    payment_method_id INT PRIMARY KEY,
    method_name VARCHAR(20) UNIQUE NOT NULL CHECK (method_name IN ('Credit Card', 'PayPal', 'Bank Transfer', 'Crypto'))
);

CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    service_id INT NOT NULL,
    billing_cycle_id INT NOT NULL,
    status_id INT NOT NULL,
    amount NUMERIC(10,2) CHECK (amount >= 0),
    date DATE NOT NULL,
    next_payment_date DATE NOT NULL CHECK (next_payment_date >= date),
    auto_renew BOOLEAN NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES Services(service_id) ON DELETE CASCADE,
    FOREIGN KEY (billing_cycle_id) REFERENCES Billing_Cycles(billing_cycle_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES Subscription_Status(status_id) ON DELETE CASCADE
);

CREATE TABLE Subscription_Info (
    subscription_id INT PRIMARY KEY,
    user_id INT,
    service_id INT,
    billing_cycle_id INT,
    status_id INT,
    next_payment_date DATE CHECK (next_payment_date >= CURRENT_DATE),
    auto_renew BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id),
    FOREIGN KEY (billing_cycle_id) REFERENCES Billing_Cycles(billing_cycle_id),
    FOREIGN KEY (status_id) REFERENCES Subscription_Status(status_id)
);

CREATE TABLE Payments_Info (
    payment_id NUMERIC PRIMARY KEY,
    subscription_id INT,
    amount DECIMAL(12,2) CHECK (amount >= 0),
    date DATE,
    payment_date DATE,
    payment_method_id INT,
    status VARCHAR(20) CHECK (status IN ('Completed', 'Failed', 'Pending')),
    FOREIGN KEY (subscription_id) REFERENCES Subscription_Info(subscription_id),
    FOREIGN KEY (payment_method_id) REFERENCES Payment_Methods(payment_method_id)
);

CREATE TABLE Subscription_Metadata (
    subscription_id INT PRIMARY KEY,
    user_id INT,
    service_id INT,
    billing_cycle_id INT,
    status_id INT,
    next_payment_date DATE CHECK (next_payment_date >= CURRENT_DATE),
    auto_renew BOOLEAN,
    FOREIGN KEY (service_id) REFERENCES Services(service_id),
    FOREIGN KEY (billing_cycle_id) REFERENCES Billing_Cycles(billing_cycle_id),
    FOREIGN KEY (status_id) REFERENCES Subscription_Status(status_id)
);

CREATE TABLE Notification_Messages (
    notification_id INT PRIMARY KEY,
    subscription_id INT,
	amount DECIMAL(12,2),
    date DATE,
    message TEXT NOT NULL,
    status VARCHAR(10) CHECK (status IN ('Sent', 'Pending')),
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (subscription_id) REFERENCES Subscription_Metadata(subscription_id)
);
