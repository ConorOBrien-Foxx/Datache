module value.value;

import value;

class TypeMismatchException : Exception {
    this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }
}

bool isDatacheValue(Object other) {
    return typeid(other) == typeid(DatacheValue);
}

abstract class DatacheValue {
    public static const string TAG = "DatacheValue";
    public string type;

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

    public DatacheValue add(DatacheValue other) {
        throw new TypeMismatchException("Cannot add types " ~ type ~ " and " ~ other.type);
    }
}
