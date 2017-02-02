# Solidus Weights Units

Sample application for the (maybe) `solidus_weights_units` extension.

## WAT?

This allows to insert variant weights in a specific unit (lbs, grams etc.)
Weights are converted and saved to the database using the same unit (grams).
The weight in the original unit can be viewed using `Variant#display_weight`

# TODO / QUESTIONS

- input weight must be well formatted (no wrong dot/commas separators)
- `Variant#weight` field precision can be expanded to allow > 1ton values
- not-nil weight unit makes sense, how to handle current weight values migration on existing apps?
- is overriding the `Variant#weight=` setter a good idea? (probably not until this become the default/core behaviour)
- why isn't the USA on the metric system?
