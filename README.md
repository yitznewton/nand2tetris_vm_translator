# nand2tetris VM Translator

[![Travis](https://img.shields.io/travis/yitznewton/nand2tetris_vm_translator.svg)](https://travis-ci.org/yitznewton/nand2tetris_vm_translator/)
[![license](https://img.shields.io/github/license/yitznewton/nand2tetris_vm_translator.svg)](https://www.gnu.org/copyleft/gpl.html)

## Background

This is a Ruby translator for VM bytecode specified in the
[nand2tetris](http://www.nand2tetris.org/) computer architecture course.

Specification/instructions: [spec](http://www.nand2tetris.org/chapters/chapter%2007.pdf)

## Tests

There are acceptance tests provided by the nand2tetris project.

To run the nand2tetris tests:

```shell
$ ruby ./VMTranslator.rb ./StackArithmetic/StackTest/ > ./StackArithmetic/StackTest/StackTest.asm
$ ./tools/CPUEmulator.sh ./StackArithmetic/StackTest/StackTest.tst
$ ruby ./VMTranslator.rb ./ProgramFlow/BasicLoop/ > ./ProgramFlow/BasicLoop/BasicLoop.asm
$ ./tools/CPUEmulator.sh ./ProgramFlow/BasicLoop/BasicLoop.tst
$ ruby ./VMTranslator.rb ./ProgramFlow/FibonacciSeries/ > ./ProgramFlow/FibonacciSeries/FibonacciSeries.asm
$ ./tools/CPUEmulator.sh ./ProgramFlow/FibonacciSeries/FibonacciSeries.tst
$ ruby ./VMTranslator.rb ./MemoryAccess/StaticTest/ > ./MemoryAccess/StaticTest/StaticTest.asm
$ ./tools/CPUEmulator.sh ./MemoryAccess/StaticTest/StaticTest.tst
$ ruby ./VMTranslator.rb ./FunctionCalls/SimpleFunction/ > ./FunctionCalls/SimpleFunction/SimpleFunction.asm
$ ./tools/CPUEmulator.sh ./FunctionCalls/SimpleFunction/SimpleFunction.tst
```

## License

GNU General Public License Version 3.0
