const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
];

const colorCode = (color) => COLORS.indexOf(color);

export const decodedValue = (colors) =>
  colors.slice(0, 2).reduce(
    (acc, cur) => acc * 10 + colorCode(cur),
    0
  );
