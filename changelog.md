# History of user-visible changes

## 0.3.1 / 2023-08-03

* Relicense to MIT.
* Fix a bug with comment nodes not having newlines after.
* Support for `case`, `case-try`, and `match-try`.

## 0.3.0 / 2023-01-29

* Treat `with-*` and `def*` forms as macros with a body.
* Improved handling of `&into` and `&until` in iterator bindings.
* Fix a bug where comments in k/v tables could disappear.
* Allow certain forms to preserve one-liner status.
* Fix a bug where table keys weren't always sorted.

## 0.2.3 / 2022-04-26

* Fix a bug around how vargs are handled in Fennel 1.1.0.

## 0.2.2 / 2021-10-01

* Fix a bug with multiple lines of sequential comments in kv tables.

## 0.2.1 / 2021-03-07

* Be more forgiving of ASTs which lack source metadata.

## 0.2.0 / 2021-03-06

* Complete rewrite which uses Fennel's own parser and pretty-printer.
* Good enough to run on all of Fennel's own codebase.

## 0.1.0 / 2020-05-21

* First release of heuristic-based indentation-only formatter.
