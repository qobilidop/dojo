#include <cstdio>
#include <iterator>
#include <type_traits>
#include <unordered_map>
#include <vector>

template <typename T>
concept Integer = std::is_integral<T>::value;

template <Integer T>
T mode(const T* values, size_t length) {
  std::unordered_map<T, size_t> freqs{};
  size_t freq_max{ 0 };

  // Determine max frequency
  for (size_t i = 0; i < length; ++i) {
    auto val{ values[i] };
    if (!freqs.contains(val)) {
      freqs[val] = 1;
    } else {
      ++freqs[val];
    }
    if (freqs[val] > freq_max) {
      freq_max = freqs[val];
    }
  }

  // Determine all modes
  std::vector<T> modes{};
  for (const auto& [val, freq] : freqs) {
    if (freq == freq_max) {
      modes.push_back(val);
    }
  }

  // Return 0 if not a unique mode
  if (modes.size() != 1) {
    return 0;
  }
  return modes[0];
}

int main() {
  printf("\nex-6-3:\n");

  int vals1[]{ 1, 2, 2, 2, 3 };
  printf("mode: %d\n", mode(vals1, std::size(vals1)));

  // The following code would err
  // float vals2[]{ 1, 2, 2, 2, 3 };
  // printf("mode: %f\n", mode(vals2, std::size(vals2)));
}
