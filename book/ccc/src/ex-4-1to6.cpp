#include <cstdio>
#include <cstring>
#include <chrono>

struct TimerClass {

  TimerClass(const char* name) {
    printf("constructor: %s\n", name);
    timestamp = std::chrono::steady_clock::now();
    copy_name(name);
  }

  ~TimerClass() {
    auto now{ std::chrono::steady_clock::now() };
    std::chrono::duration<double> elapsed_seconds{ now  - timestamp };
    printf("Timer %s elapsed: %gs\n", name, elapsed_seconds.count());
    delete[] name;
  }

  // copy

  TimerClass(const TimerClass& other) {
    printf("copy constructor: %s\n", other.name);
    timestamp = other.timestamp;
    copy_name(other.name);
  }

  TimerClass& operator=(const TimerClass& other) {
    printf("copy assignment: %s\n", other.name);
    if (this == &other) {
      return *this;
    }
    timestamp = other.timestamp;
    delete[] name;
    copy_name(other.name);
    return *this;
  }

  // move

  TimerClass(TimerClass&& other) noexcept {
    printf("move constructor: %s\n", other.name);
    timestamp = std::move(other.timestamp);
    move_name(other.name);
  }

  TimerClass& operator=(TimerClass&& other) noexcept {
    printf("move assignment: %s\n", other.name);
    if (this == &other) {
      return *this;
    }
    timestamp = std::move(other.timestamp);
    delete[] name;
    move_name(other.name);
    return *this;
  }

private:
  std::chrono::time_point<std::chrono::steady_clock> timestamp;
  char* name = nullptr;

  void copy_name(const char* name) {
    this->name = new char[std::strlen(name) + 1];
    std::strcpy(this->name, name);
  }

  void move_name(char*& name) noexcept {
    this->name = name;
    name = nullptr;
  }
};

void do_some_work(TimerClass& timer) {
  TimerClass timer_inner{ std::move(timer) };
  for (auto i = 0; i < 2<<16; ++i) {}
}

int main() {
  TimerClass timer1{ "1" };

  TimerClass timer2{ "2" };
  TimerClass timer2c{ timer2 };

  TimerClass timer3{ "3" };
  TimerClass timer3m{ std::move(timer3) };

  TimerClass timer4{ "4" };
  TimerClass timer5{ "5" };
  timer5 = timer4;

  TimerClass timer6{ "6" };
  TimerClass timer7{ "7" };
  timer7 = std::move(timer6);

  TimerClass timer_outer{ "outer" };
  do_some_work(timer_outer);
}
