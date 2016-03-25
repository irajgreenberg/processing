// chart
DataLoader loader;
PieChart pie;
// data
// gui

// this is polymorphic
Chart pie1 = new PieChart(); // often preferred.
PieChart pie2 = new PieChart();

// JSONObject data, StyleFeatures styles, Dimension dim
// where's the data
loader = new DataLoader("url to data");
Chart bar1 = new BarChart(loader );





void buildVisualizations(ArrayList<Chart> charts) {
}