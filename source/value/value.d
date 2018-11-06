module value.value;

import value;

class TypeMismatchException : Exception {
    this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }
}

/// base class for all values in Datache
abstract class DatacheValue {
    /// the string constant representing the name of the class
    /// prefer more conventional names, like "number" or "character"
    public static const string TAG = "DatacheValue";
    /// the instance's type (assigned by `new DatacheValue(string)`)
    public string type;

    /// default constructor to be called by every implementing class
    this(string tag) {
        type = tag;
    }

    abstract bool instanceEqualTo(DatacheValue other);

    override bool opEquals(Object other) {
        import std.stdio;
        // thanks to https://forum.dlang.org/thread/gaq1cl$1ev8$1@digitalmars.com
        if(auto casted = cast(DatacheValue) other) {
            return instanceEqualTo(casted);
        }
        else {
            return false;
        }
    }

    override string toString() {
        return "<DatacheValue with no representation>";
    }

    /// by default, addition is not supported for the base class
    public DatacheValue add(DatacheValue other) {
        throw new TypeMismatchException("Cannot add types " ~ type ~ " and " ~ other.type);
    }
}
