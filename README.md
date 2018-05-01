# weld-pool

This code intends to simulate a weld pool from a tungsten inert gas (TIG) welding process.

## Getting Started

This should run on an OSX or Linux computer with no errors.

### Prerequisites

You will need a C compiler such as "gcc" and a MATLAB installation for graphing.

```
gcc --version
```

### Installing

A makefile is included for convenience.

```
make
```

You can then graph the results with the included MATLAB code.

## Running a test

Test it to see if it works properly.

```
make test
```

## Cool Features

* The makefile will only compile whats necessary after changes.
* Parallel computation via OpenMP. Test case went from 16 seconds to 3 seconds

## Built With

* C
* OpenMP
* MATLAB

## Authors

* **Rekesh Ali** - *Initial work* - [GitHub](https://github.com/rekeshali)
* **Eric Heikkenen** - *Edits* - [GitHub](https://github.com/eheikkenen)

## Acknowledgments

* Professor V. Alexiades
