# Create sample users
user1 = User.create(name: 'Alice', email: 'alice@example.com', password: 'henry')
user2 = User.create(name: 'Bob', email: 'bob@example.com', password: 'password')
user3 = User.create(name: 'Charlie', email: 'charlie@example.com', password: 'qwerty')
user4 = User.create(name: 'David', email: 'david@example.com', password: 'letmein')

# Create sample incomes
Income.create(user: user1, name: 'Salary', amount: 5000)
Income.create(user: user1, name: 'Freelance Work', amount: 1000)
Income.create(user: user2, name: 'Part-time Job', amount: 2000)
Income.create(user: user2, name: 'Investment', amount: 1500)
Income.create(user: user3, name: 'Business Revenue', amount: 3000)
Income.create(user: user4, name: 'Rental Income', amount: 2500)

# Create sample bills
Bill.create(user: user1, name: 'Rent', amount: 1000, is_paid: false, due_date: Date.today + 15)
Bill.create(user: user1, name: 'Electricity', amount: 200, is_paid: true, due_date: Date.today + 10)
Bill.create(user: user2, name: 'Internet', amount: 50, is_paid: false, due_date: Date.today + 20)
Bill.create(user: user2, name: 'Water', amount: 100, is_paid: false, due_date: Date.today + 25)
Bill.create(user: user3, name: 'Phone', amount: 80, is_paid: true, due_date: Date.today + 12)
Bill.create(user: user3, name: 'Gas', amount: 150, is_paid: false, due_date: Date.today + 18)
Bill.create(user: user4, name: 'Insurance', amount: 300, is_paid: true, due_date: Date.today + 8)
Bill.create(user: user4, name: 'Credit Card', amount: 500, is_paid: false, due_date: Date.today + 5)

# Create sample personals
Personal.create(user: user1, name: 'Shopping', amount: 500)
Personal.create(user: user1, name: 'Eating Out', amount: 200)
Personal.create(user: user2, name: 'Entertainment', amount: 300)
Personal.create(user: user2, name: 'Travel', amount: 400)
Personal.create(user: user3, name: 'Gym Membership', amount: 100)
Personal.create(user: user4, name: 'Hobbies', amount: 150)
