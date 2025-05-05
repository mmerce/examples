# Feature engineering: lags and windows

Creating some new features that contain the lagged values of existing ones or
aggregated values in windows.

The script will generate a new dataset adding new fields based on the fields
defined as keys in the `field_lags` map. The values of the map contain a list
of numbers that indicate the different lags to be used to generate new features.
E.g.: {"steps" [1 3 7 14]} will create 4 new features (`steps-1`, `steps-3`,
`steps-7` and `steps-14` that will contain the values in the `steps` 
field with the correspoding delay. It will also add new values computed as
aggregations of windows defined on some of the fields. E.g.: {"steps"
{"mean" [[-3 -1] [-7 -1] [-14 -1]]}} will add 3 new fields `steps_mean[-3 -1]`,
`steps_mean[-7 -1]` and `steps_mean[-14 -1]`.


