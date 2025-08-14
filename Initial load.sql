
COPY Users(user_id, customer_id, name, email, phone_number)
FROM '/Library/PostgreSQL/17/data/transformed_sampleusers.csv' DELIMITER ',' CSV HEADER;


COPY Categories(category_id, category_name)
FROM '/Library/PostgreSQL/17/data/transformed_samplecategories.csv' DELIMITER ',' CSV HEADER;

COPY Services(service_id, service_name, category_id)
FROM '/Library/PostgreSQL/17/data/transformed_sampleservices.csv' DELIMITER ',' CSV HEADER;


COPY Billing_Cycles(billing_cycle_id, cycle_name)
FROM '/Library/PostgreSQL/17/data/transformed_samplebilling_cycles.csv' DELIMITER ',' CSV HEADER;


COPY Subscription_Status(status_id, status_name)
FROM '/Library/PostgreSQL/17/data/transformed_samplesubscription_status.csv' DELIMITER ',' CSV HEADER;


COPY Subscriptions(amount, date, subscription_id, user_id, service_id, billing_cycle_id, status_id, next_payment_date, auto_renew)
FROM '/Library/PostgreSQL/17/data/transformed_samplesubscriptions.csv' DELIMITER ',' CSV HEADER;


COPY Payment_Methods(payment_method_id, method_name)
FROM '/Library/PostgreSQL/17/data/transformed_samplepayment_methods.csv' DELIMITER ',' CSV HEADER;


COPY Payments (amount, date, subscription_id, user_id, service_id, billing_cycle_id, status_id, next_payment_date, auto_renew,
               payment_id, payment_date, payment_method_id, status)
FROM '/Library/PostgreSQL/17/data/transformed_samplepayments.csv' DELIMITER ',' CSV HEADER;


COPY Notifications (amount, date, subscription_id, user_id, service_id, billing_cycle_id, 
                    status_id, next_payment_date, auto_renew, notification_id, message, status, sent_at)
FROM '/Library/PostgreSQL/17/data/transformed_samplenotifications.csv' DELIMITER ',' CSV HEADER;
