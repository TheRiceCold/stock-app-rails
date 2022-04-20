# Stock Trading App

[Avion School](https://www.avionschool.com/) 2nd backend project using ruby on rails.

## User Stories

- Trader 
  - Able to create an account to buy and sell stocks.
  - Able to log in credentials to access his/her account
  - Able to buy stocks to add investment(account should be approved).
  - Able to see all his/her stocks in My Portfolio page.
  - Able to monitor all transactions(buy/sell) in the Transaction page.
  - Able to sell his/her stocks to gain money.
- Admin
  - Able to create a new trader(user) manually.
  - Able to edit a specific trader to update his/her details.
  - Able to view a specific trader to show his/her details.
  - Able to track all the registered traders.
  - Able to monitor all transactions to see the transaction flow of the app.

## Entity Relationship Diagram
![ERD](docs/erd.jpg)

## User Flow Diagram
![UFD](docs/ufd.jpg)

## Technologies
- Ruby v3.0.2
- Rails v7.0.2
- NodeJS v16.14.0
- Yarn 1.22
- PostgreSQL v14.2
- Heroku CLI v7.59.4

## Gems 
- devise
- ransack
- activeadmin
- iex-ruby-client
- dotenv-rails (development)

# Color Scheme
- #00c8f2 blue
- #f9004e pink/red
- #00b982 green
- #1c1c1c black(bg)
