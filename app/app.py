# app.py - Simple Python demo app for recommendations
import sqlite3

# Connect to database
conn = sqlite3.connect('library.db')
cursor = conn.cursor()

# Query: recommendation engine
query = """
WITH favorite AS (
    SELECT 
        user_id,
        category,
        COUNT(*) AS borrow_count,
        RANK() OVER (PARTITION BY user_id ORDER BY COUNT(*) DESC) AS rnk
    FROM borrow_history bh
    JOIN books b ON bh.book_id = b.book_id
    GROUP BY user_id, category
),
favorite_category AS (
    SELECT user_id, category FROM favorite WHERE rnk = 1
)
SELECT 
    u.name AS user,
    b.title AS recommended_book,
    b.category
FROM favorite_category fc
JOIN users u ON fc.user_id = u.user_id
JOIN books b ON b.category = fc.category
WHERE b.book_id NOT IN (
    SELECT book_id FROM borrow_history WHERE user_id = fc.user_id
)
ORDER BY u.name;
"""

for row in cursor.execute(query):
    print(row)

conn.close()
