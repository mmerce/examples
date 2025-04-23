# Time series data preprocessing

The script checks and corrects several common issues found in datasets
for time series.

The usual problems found in Time Series data are:

- Order
- Gaps
- Multiple rows per sequence value

This script solves them all by ordering, filling gaps according to the sequence
defined by the field used as key and the user-given lapse between its
consecutive values and removing rows with duplicated key-field values.
