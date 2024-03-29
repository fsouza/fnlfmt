# Fennel Format

Format your Fennel!

## Usage

    $ make install PREFIX=$HOME # or sudo make install in /usr/local
    $ ./fnlfmt mycode.fnl # prints formatted code to standard out
    $ ./fnlfmt --fix mycode.fnl # replaces the file with formatted code
    $ curl localhost:8080/my-file.fnl | ./fnlfmt - # pipe to stdin

You can skip reformatting of top-level forms by placing a comment
before them. This does not work for nested forms.

```fennel
(fn this-function [can be formatted ...]
  ...)

;; fnlfmt: skip
(local this-table ["benefits"          :from
                   "different kind of" :FORMATTING
                   "because of"        :reasons])

(fn this-function [will-be]
  (formatted :normally "again, haha"))
```

## Description

Formatting is essentially an aesthetic process; any automated attempt
at doing it will necessarily encounter situations where it produces
output that doesn't look as good as it would if a human were making
the decisions. That said, the goal is to at worst emit output which,
if less than ideal, is at least not objectionable. Currently the
indentation decisions it makes are great, but it occasionally puts
newlines in places that a human would not.

For the most part, `fnlfmt` follows established lisp conventions when
determining how to format a given piece of code. Key/value tables are
shown with each key/value pair on its own line, unless they are small
enough to all fit on one line. Sequential tables similarly have each
element on their own line unless they fit all on a single line. Tables
with string keys and symbol values will use `{: foo : bar}` shorthand
notation where possible.

Calls are formatted differently depending on whether they are calling
a regular function/macro or whether they're calling a special macro
which is known to have a "body"; in the latter case every element is
given its own line, usually indented 2 spaces in.

Forms calling `match` and `if` are treated differently; if possible it
will attempt to pair off their pattern/condition clauses with the body
on the same line. If that can't fit, it falls back to one-form-per-line.

Certain forms which have a body are sometimes allowed to keep their
body on the same line as the call, if the original code has it that
way, provided the body doesn't nest more than two levels and fits in
the line length limit.

Strings are formatted using `:colon-notation` where possible, unless
they consist entirely of punctuation.

Top level forms may or may not have blank lines between them depending on
whether the input code spaces them out. Functions defined inside a
body form get empty lines spacing them out as well.

Similarly `if` forms and arrow forms will occasionally be allowed to
be one line if the original code had them as one-liners.

By design there is no way to configure it; the indentation should be
considered canonical other than bugs or when new features are added to
Fennel itself.

## Known issues

* Comments will not be wrapped.
* When using fnlfmt as a library, it may modify the AST argument.
* Function argument lists will be displayed one-per-line if they can't
  all fit on one line. (This is inherited from `fennel.view`.)

Some of the issues are inherent to this approach, or at least cannot
be fixed without major changes:

* Numbers are always emitted as decimal; hex notation is not preserved.
* Page breaks and other whitespace will not be preserved.
* Macros that take a body argument but aren't built-in will only be indented
  correctly if their name starts with `with-` or `def`. Functions which
  use this naming convention will be indented as if they were macros.

## Other functionality

The file `indentation.fnl` contains functionality for implementing
heuristic-based indentation which does not use a parser. This can be
useful for text editors where you want to be able to indent even in
cases where the code does not parse because it's incomplete.

The file `macrodebug.fnl` contains a replacement for Fennel's
`macrodebug` function which pretty-prints the macroexpansion using the
full formatter.

## Contributing

Send patches or bug reports directly to the maintainer or the
[Fennel mailing list](https://lists.sr.ht/%7Etechnomancy/fennel).

## License

Copyright © 2019-2023 Phil Hagelberg and contributors

Released under the MIT license; see LICENSE.
