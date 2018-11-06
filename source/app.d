import std.stdio;
/* import dunit; */
import value;

void main(string[] args) {
    version(unittest) {
        /* writeln("testing");
        dunit_main(args); */
    }
    else {
        DatacheValue x, y, sum, sumCheck;
        x = new DatacheNumber(123);
        y = new DatacheNumber(42);
        sumCheck = new DatacheNumber(165);
        sum = x.add(y);

        writeln(sum, ";", sumCheck);
        writeln(sum == sumCheck);
        writeln(sum == new DatacheNumber(166));
    }
}
