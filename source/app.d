import std.stdio;
import dunit;

void main(string[] args) {
    version(unittest) {
        dunit_main(args);
    }
    else {
        writeln("todo: application");
    }
}
