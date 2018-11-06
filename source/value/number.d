module value.number;

import std.bigint;
import std.conv;
import std.traits;

import value;

class DatacheNumber : DatacheValue {
    private static const string TAG = "number";
    public BigInt value;

    this(T)(T x) {
        this(BigInt(x));
    }
    this(BigInt n) {
        super(DatacheNumber.TAG);
        value = n;
    }

    override bool instanceEqualTo(DatacheValue other) {
        import std.stdio;

        if(other.type != DatacheNumber.type)
            return false;

        DatacheNumber a = cast(DatacheNumber) other;

        return value == a.value;
    }
    unittest {
        DatacheNumber a1, a2, b;
        a1 = new DatacheNumber(100);
        a2 = new DatacheNumber(100);
        b = new DatacheNumber(123);
        assert(a1.instanceEqualTo(a2));
        assert(a2.instanceEqualTo(a1));
        assert(!a1.instanceEqualTo(b));
        assert(!b.instanceEqualTo(a1));
    }

    override DatacheValue add(DatacheValue other) {
        if(other.type == DatacheNumber.TAG) {
            DatacheNumber a = cast(DatacheNumber)other;
            return new DatacheNumber(value + a.value);
        }
        return null;
    }

    unittest {
        DatacheValue a = new DatacheNumber(100);
        DatacheValue b = new DatacheNumber(42);

        assert(a.add(b) == new DatacheNumber(142));
    }

    override string toString() {
        return to!string(value);
    }
}

/* import dunit;
@Test */
// i have no idea how to do tests so... :|
