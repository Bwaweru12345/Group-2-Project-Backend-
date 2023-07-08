# Create sample users
user1 = User.create(name: 'Alice', email: 'alice@example.com', password: 'henry')
user2 = User.create(name: 'Bob', email: 'bob@example.com', password: 'password')

# Create sample incomes
Income.create(user: user1, name: 'Salary', amount: 5000)
Income.create(user: user1, name: 'Freelance Work', amount: 1000)
Income.create(user: user2, name: 'Part-time Job', amount: 2000)

# Create sample bills
Bill.create(user: user1, name: 'Rent', amount: 1000, is_paid: false, due_date: Date.today + 15)
Bill.create(user: user1, name: 'Electricity', amount: 200, is_paid: true, due_date: Date.today + 10)
Bill.create(user: user2, name: 'Internet', amount: 50, is_paid: false, due_date: Date.today + 20)

# Create sample personals
Personal.create(user: user1, name: 'Shopping', amount: 500)

Personal.create(user: user2, name: 'Dining out', amount: 200)


