const COLOR_CODE = new Map([
  ['black', 0],
  ['brown', 1],
  ['red', 2],
  ['orange', 3],
  ['yellow', 4],
  ['green', 5],
  ['blue', 6],
  ['violet', 7],
  ['grey', 8],
  ['white', 9]
])

export const colorCode = (color) => COLOR_CODE.get(color);

export const COLORS = Array.from(COLOR_CODE.keys());
