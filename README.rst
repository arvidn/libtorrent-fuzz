libtorrent fuzzing
==================

Fuzzing of various libtorrent_ APIs (both internal and external),
inspired by Kostya Serebryany's `cppcon 2017 presentation`_

This project requires:

.. _`libtorrent`: https://www.github.com/arvidn/libtorrent/
.. _`cppcon 2017 presentation`: https://www.youtube.com/watch?v=k-Cv8Q3zWNQ&index=36&list=PLHTh1InhhwT6bwIpRk0ZbCA0N2p1taxd6

clang
.....

A very recent version of clang that supports libFuzzer.
clang-5.0 may not be recent enough, you may have to build head from source.

boost-build
...........

Also known as ``b2``. To configure boost build with your fresh clang build,
create a ``~/user-config.jam`` with something like this in it (example for macOS)::

	using darwin : 6.0 : ~/Documents/dev/clang/build/bin/clang++ : <cxxflags>-std=c++11 ;

corpus
......

The corpus is the set of inputs that has been built by libFuzzer. It's the seed
for testing more mutations. The corpus is not checked into the repository,
before running the fuzzer it is advised to download and unzip the corpus
associated with the latest release on github.

	https://github.com/arvidn/libtorrent-fuzz/releases

Uzip the corpus in the root directory::

	tar xzf corpus.tar.gz

running
.......

To run the fuzzer::

	b2 darwin-stable link=static logging=off -j4

By default, 900000 iterations are run per API. This can be adjusted in the Jamfile_.

.. _`Jamfile`: https://github.com/arvidn/libtorrent-fuzz/blob/master/Jamfile

contribute
..........

Please consider contributing back any updated corpuses (amended by more seed
inputs) or fuzzers for more APIs in libtorrent.

