module value.character;

import std.conv;

import value;

class DatacheCharacter : DatacheValue {
    public static const string TAG = "character";
    public dchar value;

    this(dchar c) {
        super(DatacheCharacter.TAG);
        value = c;
    }

    override string toString() {
        return to!string(value);
    }
}
