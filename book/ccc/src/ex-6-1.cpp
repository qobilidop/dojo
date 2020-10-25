#include <cstdio>
#include <iterator>
#include <unordered_map>
#include <vector>

int mode(const int* values, size_t length) {
  std::unordered_map<int, size_t> freqs{};
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
  std::vector<int> modes{};
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
  printf("\nex-6-1:\n");

  int vals1[]{ 1, 2, 2, 2, 3 };
  printf("mode: %d\n", mode(vals1, std::size(vals1)));

  int vals2[]{ 1, 1, 2, 3, 3 };
  printf("mode: %d\n", mode(vals2, std::size(vals2)));
}
