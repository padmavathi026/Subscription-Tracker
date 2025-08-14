# Subscription-Tracker

Subscription & Payment Tracking System (Milestone 2)

End-to-end mini data platform for managing subscriptions, payments, and user notifications on PostgreSQL, with a simple Streamlit UI for running SQL queries. It includes a relational schema, database load scripts, cleaned/transformed CSVs, and a preprocessing notebook.

Features

Relational data model for users, services, categories, billing cycles, subscription status, payment methods, payments, and notifications

SQL scripts to create and populate the database

Cleaned and transformed CSV datasets (full and sample subsets)

Streamlit app for ad-hoc querying and quick insights

Preprocessing notebook documenting the data preparation steps

Tech Stack

Database: PostgreSQL

UI: Streamlit

Python libraries: pandas, psycopg2

Data format: CSV

Repository Contents

app.py

create.sql

load.sql

Initial_create.sql

Initial load.sql

DMQL Preprocessing .ipynb

financial_transactions.csv

Subscription_Info_CLEANED.csv

Subscription_Metadata_CLEANED.csv

Payments_Info_CLEANED.csv

Notification_Messages_CLEANED.csv

transformed_users.csv

transformed_services.csv

transformed_categories.csv

transformed_billing_cycles.csv

transformed_subscription_status.csv

transformed_subscriptions.csv

transformed_payments.csv

transformed_notifications.csv

Sample Data (folder with 50% subsets of each transformed table)

Data Model (Overview)

Users → Subscriptions (one-to-many)

Services → Subscriptions (one-to-many)

Categories → Services (one-to-many)

Billing_Cycles → Subscriptions (one-to-many)

Subscription_Status → Subscriptions (one-to-many)

Payment_Methods → Payments_Info (one-to-many)

Subscriptions → Payments_Info (one-to-many)

Subscriptions → Notification_Messages (one-to-many)

Primary tables: Users, Categories, Services, Billing_Cycles, Subscription_Status, Payment_Methods, Subscriptions, Payments_Info, Notification_Messages.
Convenience/flattened tables: Subscription_Info, Subscription_Metadata.

Getting Started

Install PostgreSQL (version 14 or later recommended) and Python 3.9 or later.

Create a database (the sample app expects a database named MainDB, but any name works).

Open create.sql in your SQL client and execute it to create the tables.

Load the CSVs using load.sql or your SQL client’s import tools. If you use the provided scripts, adjust file paths so they point to the CSVs on your machine.

Update database connection settings inside app.py to match your environment (database name, user, password, host, port).

Start Streamlit and open the app file to launch the UI.

How to Use

Run read-only queries from the Streamlit UI to explore subscriptions, payments, and notifications.

Use the full data or the Sample Data folder for a quicker trial.

Typical analyses include: listing active subscriptions by user, tracking monthly revenue by service, and reviewing upcoming payments within a selected time window.

Notes on Data

Cleaned CSVs (files ending in CLEANED or starting with transformed_) are ready to load.

Sample Data contains 50% subsets for faster testing and demos.

The preprocessing notebook documents the steps taken to produce the transformed datasets.

Troubleshooting

If data won’t load, confirm the CSV file paths referenced in your SQL client or scripts match your machine’s locations.

If the Streamlit app cannot connect, verify the database is running and the credentials in app.py are correct.

If you encounter permissions issues while loading data, use your SQL client’s import wizard or ensure the database service account can read the CSV directory.

