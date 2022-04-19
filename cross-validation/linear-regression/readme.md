# Linear regression's k-fold cross-validation

The objective of this script is to perform a k-fold cross validation of a
linear regression built from a dataset. The algorithm:

- Divides the dataset in k parts
- Holds out the data in one of the parts and builds a logistic regression
  with the rest of data
- Evaluates the linear regression with the hold out data
- The second and third steps are repeated with each of the k parts, so that
  k evaluations are generated
- Finally, the evaluation metrics are averaged to provide the cross-validation
  metrics.

The **inputs** for the script are:

* `dataset-id`: (dataset-id) Dataset ID for the training data
* `k-folds`: (integer) Number of folds to split the dataset into (optional,
                       default=5)
* `objective-id`: (string) ID of the objective field for the model (optional)
* `bias`: (number) Scale of the intercept term (optional, default=1)
* `default-numeric-value`: (string) List of values to be used as
                                    objective_weights (optional, default="")
* `field-codings`: (list) Coding schemes for categorical fields: 'dummy',
                          'contrast', or 'other' (optional, default=[])
* `seed`: (string) Seed used in random samplings (optional,
                   default="cross-validation")
* `delete-resources`: (boolean) Whether to delete intermediate resources
                      (optional, default=true)

As you can see, most of the inputs are optional. They default to the defaults
in the platform. The `objective-id` will also be inferred from the one in
the dataset if it is not provided.

# Using the linear regression's k-fold cross-validation script

One just needs to call

```
(linear-cross-validation dataset-id
                         k-folds
                         objective-id
                         bias
                         default-numeric-value
                         field-codings
                         seed
                         delete-resources)
```

using the previously described inputs.

The **output** of the script will be an `evaluation ID`. This evaluation is a
cross-validation, meaning that its metrics are averages of the k evaluations
created in the cross-validation process.
