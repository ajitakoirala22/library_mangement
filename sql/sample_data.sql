-- sample_data.sql
INSERT INTO users VALUES
(1, 'Amit'), (2, 'Sara'), (3, 'John');

INSERT INTO books VALUES
(1, 'Atomic Habits', 'James Clear', 'Self-help'),
(2, 'Deep Work', 'Cal Newport', 'Productivity'),
(3, 'Harry Potter', 'J.K. Rowling', 'Fantasy'),
(4, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy'),
(5, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance'),
(6, 'The Psychology of Money', 'Morgan Housel', 'Finance');

INSERT INTO borrow_history VALUES
(1, 1, 1, '2024-01-10', '2024-01-20'),
(2, 1, 2, '2024-02-01', '2024-02-10'),
(3, 2, 3, '2024-01-15', '2024-01-25'),
(4, 2, 4, '2024-02-05', '2024-02-15'),
(5, 3, 5, '2024-01-12', '2024-01-20');
