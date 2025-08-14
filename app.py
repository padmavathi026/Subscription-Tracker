import streamlit as st
import psycopg2
import pandas as pd
st.title("SQL Query Runner (PostgreSQL)")
query = st.text_area("Write your SQL Query Below:", height=200)
if st.button("Run Query"):
    try:
        # Connect to PostgreSQL
        conn = psycopg2.connect(
            dbname="MainDB",
            user="postgres",
            password="Padpoo@12",
            host="localhost",
            port="5432"
        )
        cursor = conn.cursor()

        if query.strip().lower().startswith("select"):
            df = pd.read_sql(query, conn)
            st.success("Query executed successfully!")
            st.dataframe(df)
        else:
            cursor.execute(query)
            conn.commit()
            st.success(" Query executed and changes committed!")
        
        cursor.close()
        conn.close()

    except Exception as e:
        st.error(f"Error: {e}")
