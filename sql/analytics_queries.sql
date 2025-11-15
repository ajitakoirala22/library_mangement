-- analytics_queries.sql

-- Most borrowed categories per user
SELECT
    u.name,
    b.category,
    COUNT(*) AS total_borrowed
FROM borrow_history bh
JOIN users u ON bh.user_id = u.user_id
JOIN books b ON bh.book_id = b.book_id
GROUP BY u.name, b.category
ORDER BY u.name, total_borrowed DESC;

-- Top 5 most borrowed books
SELECT
    b.title,
    COUNT(*) AS borrow_count
FROM borrow_history bh
JOIN books b ON bh.book_id = b.book_id
GROUP BY b.book_id, b.title
ORDER BY borrow_count DESC
LIMIT 5;
