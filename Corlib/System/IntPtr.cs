﻿using System.Runtime.CompilerServices;

namespace System
{
    public unsafe struct IntPtr
    {
        void* _value;

        public IntPtr(void* value) { _value = value; }
        public IntPtr(int value) { _value = (void*)value; }
        public IntPtr(uint value) { _value = (void*)value; }
        public IntPtr(long value) { _value = (void*)value; }
        public IntPtr(ulong value) { _value = (void*)value; }

        [Intrinsic]
        public static readonly IntPtr Zero;

        //public override bool Equals(object o)
        //	=> _value == ((IntPtr)o)._value;

        public bool Equals(IntPtr ptr)
            => _value == ptr._value;

        //public override int GetHashCode()
        //	=> (int)_value;

        public static implicit operator IntPtr(int value) => new IntPtr(value);
        public static implicit operator IntPtr(uint value) => new IntPtr(value);
        public static implicit operator IntPtr(long value) => new IntPtr(value);
        public static implicit operator IntPtr(ulong value) => new IntPtr(value);
        public static implicit operator IntPtr(void* value) => new IntPtr(value);
        public static implicit operator void*(IntPtr value) => value._value;

        public static implicit operator int(IntPtr value)
        {
            var l = (long)value._value;

            return checked((int)l);
        }

        public static implicit operator long(IntPtr value) => (long)value._value;
        public static implicit operator ulong(IntPtr value) => (ulong)value._value;

        public static IntPtr operator +(IntPtr a, uint b)
            => new IntPtr((byte*)a._value + b);

        public static IntPtr operator +(IntPtr a, ulong b)
            => new IntPtr((byte*)a._value + b);

        public static bool operator == (IntPtr a,IntPtr b) 
        {
            return a._value == b._value;
        }

        public static bool operator !=(IntPtr a, IntPtr b)
        {
            return !(a._value == b._value);
        }
    }
}