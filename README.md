<div class="title-block" style="text-align: center;" align="center">

# Bluespec Compiler - Contributed libraries and utilities

</div>

[bsc repository]: https://github.com/B-Lang-org/bsc) 
[Bluespec Inc]: https://bluespec.com

This is place to share libraries and utilities that don't belong
(or don't yet belong) in the core [bsc repository].

Files can be installed in the same way as in the [bsc repository]:

    $ make PREFIX=/tools/bluespec

If the `PREFIX` variable is not specified, the default is `inst`.

Each set of libraries is installed into its own subdirectory, so that
they are not in the path by default, but instead are only available
when explicitly added on the command line:

    $ bsc -p +:%/Libraries/FPGA/Xilinx/

Until a more sophisicated library system is available, this repository
can be used for sharing useful code.  Contributions are welcome.
No guarantees are made about the quality of this code.

---

## License

Individual contributions are responsible for specifying their own
copyright and license.  Libraries provided by [Bluespec Inc] have a
header comment that states the copyright and the license as an SPDX
short identifier (BSD-3-Clause) with the full license text given in
the `LICENSES` directory.

