#include <cstdio>

// account database

struct AccountDatabase {
  virtual ~AccountDatabase() = default;
  virtual void deposit(long id, double amount) =0;
  virtual void retrieve(long id, double amount) =0;
};

struct InMemoryAccountDatabase : AccountDatabase {
  void deposit(long id, double amount) override {
    printf("account %ld deposit: %f\n", id,  amount);
  }

  void retrieve(long id, double amount) override {
    printf("account %ld retrieve: %f\n", id,  amount);
  }
};

// logger

struct Logger {
  virtual ~Logger() = default;
  virtual void log_transfer(long from, long to, double amount) =0;
};

struct ConsoleLogger : Logger {
  ConsoleLogger(const char* tag): tag{ tag } {}

  void log_transfer(long from, long to, double amount) override {
    printf("[%s] %ld -> %ld: %f\n", tag, from, to, amount);
  }

private:
  const char* tag;
};

struct FileLogger : Logger {
  void log_transfer(long from, long to, double amount) override {
    printf("[file] %ld -> %ld: %f\n", from, to, amount);
  }
};

// bank

struct Bank {
  Bank(AccountDatabase& account_database, Logger* logger)
    : account_database{ account_database }, logger{ logger } {}

  void set_logger(Logger* new_logger) {
    logger = new_logger;
  }

  void make_transfer(long from, long to, double amount) {
    if (logger) {
      account_database.retrieve(from, amount);
      account_database.deposit(to, amount);
      logger->log_transfer(from, to, amount);
    }
  }

private:
  AccountDatabase& account_database;
  Logger* logger;
};

// main

int main() {
  InMemoryAccountDatabase account_database;
  ConsoleLogger console_logger{ "cons" };
  FileLogger file_logger;

  Bank bank{ account_database, &console_logger };
  bank.make_transfer(1000, 2000, 49.95);

  bank.set_logger(&file_logger);
  bank.make_transfer(2000, 4000, 20.00);
}
