import sqlite3

# Connect to SQLite DB
conn = sqlite3.connect('library.db')
cursor = conn.cursor()

# Read and execute schema
with open('../sql/schema.sql', 'r') as f:
    cursor.executescript(f.read())

# Insert sample data
a = open('../sql/sample_data.sql', 'r').read().split(';')
for stmt in a:
    if stmt.strip():
        cursor.execute(stmt)

conn.commit()
print("Database setup complete.")
conn.close()