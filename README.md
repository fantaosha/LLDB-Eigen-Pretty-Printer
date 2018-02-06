# LLDB Eigen Pretty Printer

LLDB Eigen Pretty Printer for matrices, arrays and quaternions of the [Eigen](http://eigen.tuxfamily.org) library.

## Example

### Dense Matrix

```cpp
Eigen::MatrixXd A(3,5);
A<< 1, 2, 3, 4, 5,
    2, 3, 4, 5, 6,
    3, 4, 6, 7, 8;
```

Corresponding output in LLDB

```
(lldb) p A
(Eigen::MatrixXd) $0 = rows: 3, cols: 5
[ 1.00000000e+00 2.00000000e+00 3.00000000e+00 4.00000000e+00 5.00000000e+00;
  2.00000000e+00 3.00000000e+00 4.00000000e+00 5.00000000e+00 6.00000000e+00;
  3.00000000e+00 4.00000000e+00 6.00000000e+00 7.00000000e+00 8.00000000e+00 ]
```

### Array

```cpp
  Eigen::Array22d B;
  B<< 1, 0,
      0, 2;
```

Corresponding output in LLDB

```
(lldb) p B
(Eigen::Array22d) $1 = rows: 2, cols: 2
[ 1.00000000e+00 0.00000000e+00;
  0.00000000e+00 2.00000000e+00 ]
```

## Installation

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/fantaosha/LLDB-Eigen-Pretty-Printer/master/tools/install.sh)"
```

__Manual Installation__

```bash
INSTALL_PATH=~/.lldb-eigen-pretty-printer
git clone https://github.com/fantaosha/LLDB-Eigen-Pretty-Printer.git $INSTALL_PATH
echo 'command script import "'$INSTALL_PATH'/LLDB_Eigen_Pretty_Printer.py"' >> ~/.lldbinit
```

__Uninstallation__

```bash
rm -fr ~/.lldb-eigen-pretty-printer
```

Afterwards remove the `command script import` command in `~/.lldbinit`.

## Acknowledgement

The development of this LLDB Eigen Pretty Printer has referred to [LLDB Eigen Data Formatter](https://github.com/tehrengruber/LLDB-Eigen-Data-Formatter) and [GDB Eigen Data Printer](https://github.com/RLovelett/eigen/tree/master/debug/gdb).

## License

Copyright © 2018 Taosha Fan

Distributed under the GNU GENERAL PUBLIC LICENSE.
