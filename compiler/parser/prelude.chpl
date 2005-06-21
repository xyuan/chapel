record pragma "codegen data" _data { -- a c array, basically
  type t;
  var _data_dummy : t;
  pragma "rename _data_this" function this(i : integer) : t {
    return _data_dummy;
    -- return __primitive("array_index", this, i);
  }
  pragma "rename _data_set" function =this(i : integer, val : t) : t {
    _data_dummy = val;
    -- return __primitive("array_set", this, i, val);
  }
  pragma "rename _data_alloc" function alloc(size, description) {  }
}

-- I/O

pragma "rename _chpl_write_boolean" function write(x : boolean) : void {
         __primitive("write", x);
}
pragma "rename _chpl_write_integer" function write(x : integer) : void {
         __primitive("write", x);
}
pragma "rename _chpl_write_float" function write(x : float) : void {
         __primitive("write", x);
}
pragma "rename _chpl_write_complex" function write(x : complex) : void {
                __primitive("write", x);
}
pragma "rename _chpl_write_string" function write(x : string) : void {
         __primitive("write", x);
}
pragma "rename _chpl_write_nil" function write(x : _nilType) : void {
         __primitive("write", x);
}
pragma "rename _chpl_write_linefeed" function writeln() : void {
         __primitive("writeln");
}
pragma "rename _chpl_read_boolean" function read(inout x : boolean) : void {
         __primitive("read", x);
}
pragma "rename _chpl_read_integer" function read(inout x : integer) : void {
         __primitive("read", x);
}
pragma "rename _chpl_read_float" function read(inout x : float) : void {
         __primitive("read", x);
}
pragma "rename _chpl_read_complex" function read(inout x : complex) : void {
         __primitive("read", x);
}
pragma "rename _chpl_read_string" function read(inout x : string) : void {
         __primitive("read", x);
}

pragma "rename _chpl_tostring_boolean"
function _tostring(x : boolean, format : string) : string {
         return __primitive("coerce", string, x);
}

pragma "rename _chpl_tostring_integer"
function _tostring(x : integer, format : string) : string {
         return __primitive("coerce", string, x);
}

pragma "rename _chpl_tostring_float"
function _tostring(x : float, format : string) : string {
         return __primitive("coerce", string, x);
}

pragma "rename _chpl_tostring_complex"
function _tostring(x : complex, format : string) : string {
         return __primitive("coerce", string, x);
}

-- intrinsic type values

const false: boolean = 0;
const true: boolean = 1;


-- math

function sqrt(x: float): float {}
function abs(x: ?t): float {}  -- BLC: should be ": t"
function ceil(x: float): float {}
function min(x, y) {
  if (x < y) {
    return x;
  } else {
    return y;
  }
}
function max(x, y) {
  if (x > y) {
    return x;
  } else {
    return y;
  }
}



-- boundary classes/functions

function wrap() {}


-- reductions

class reduction {
}

class sum {
}

class max {
}

class min {
}

class maxloc {
}

class minloc {
}


-- timers

class timer {
  function start();
  function stop();
  function read(): float;
}

-- exits

pragma "rename _chpl_exit" function exit(status : integer);

function halt() {
  __primitive("halt");
}

function assert() {
  __primitive("assert");
}


-- memory tests (These tests will be moved to a module, once we have modules.)

function _chpl_memtest_printMemTable();
function _chpl_memtest_printMemStat();
function _chpl_memtest_resetMemStat();
function _chpl_memtest_allocAndFree();
function _chpl_memtest_freedMalloc();
function _chpl_memtest_freedWithoutMalloc();
function _chpl_memtest_reallocWithoutMalloc();
function _chpl_memtest_reallocZeroSize();
function _chpl_memtest_mallocOutOfMemory();
function _chpl_memtest_reallocOutOfMemory();

function _complex_read_hack(inout x) {
  __primitive("read", x);
}

function _complex_tostring_hack(x, format : string) : string {
  return __primitive("coerce", string, x);
}




const numLocales: integer = 1;


-- FROM INTERNAL PRELUDE

record _methodTokenType {
  var _methodTokenTypeFieldDummy : integer;
}

var _methodToken : _methodTokenType;

class _seq { -- this is no longer necessary
}

class Index {
}

pragma "omit for noanalysis" class Array {
  pragma "omit for noanalysis" function this(i) {
    return __primitive("array_index", this, i);
  }
  pragma "omit for noanalysis" function this(i, j) {
    return __primitive("array_index", this, i, j);
  }
  pragma "omit for noanalysis" function this(i, j, k) {
    return __primitive("array_index", this, i, j, k);
  }
  pragma "omit for noanalysis" function =this(i, x) {
    return __primitive("array_set", this, i, x);
  }
  pragma "omit for noanalysis" function =this(i, j, x) {
    return __primitive("array_set", this, i, j, x);
  }
  pragma "omit for noanalysis" function =this(i, j, k, x) {
    return __primitive("array_set", this, i, j, k, x);
  }
}

class Domain {
}

record Tuple {
  var _tuple_dummy_field : integer;
  function this(pragma "clone_for_constants" i) { 
    return __primitive("index_object", this, i); 
  }
  function =this(pragma "clone_for_constants" i, x) {
    return __primitive("set_index_object", this, i, x);
  }
}

pragma "builtin" function +(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function -(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function *(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function /(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function &(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function |(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function ^(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function ==(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function !=(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function <=(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function >=(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function <(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function >(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function and(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function or(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }
pragma "builtin" function **(a : Array, b : Array) { return __primitive("array_pointwise_op", a, b); }

pragma "builtin" function +(a : numeric, b : numeric) { return __primitive(a, "+", b); }
pragma "builtin" function -(a : numeric, b : numeric) { return __primitive(a, "-", b); }
pragma "builtin" function *(a : numeric, b : numeric) { return __primitive(a, "*", b); }
pragma "builtin" function /(a : numeric, b : numeric) { return __primitive(a, "/", b); }
pragma "builtin" function mod(a : numeric, b : numeric) { return __primitive(a, "%", b); }
pragma "builtin" function ==(a : numeric, b : numeric) { return __primitive(a, "==", b); } 
pragma "builtin" function !=(a : numeric, b : numeric) { return __primitive(a, "!=", b); }
pragma "builtin" function <=(a : numeric, b : numeric) { return __primitive(a, "<=", b); }
pragma "builtin" function >=(a : numeric, b : numeric) { return __primitive(a, ">=", b); }
pragma "builtin" function <(a : numeric, b : numeric) { return __primitive(a, "<", b); }
pragma "builtin" function >(a : numeric, b : numeric) { return __primitive(a, ">", b); }
pragma "builtin" function &(a : numeric, b : numeric) { return __primitive(a, "&", b); }
pragma "builtin" function |(a : numeric, b : numeric) { return __primitive(a, "|", b); }
pragma "builtin" function ^(a : numeric, b : numeric) { return __primitive(a, "^", b); }
pragma "builtin" function and(a : numeric, b : numeric) { return __primitive(a, "&&", b); }
pragma "builtin" function or(a : numeric, b : numeric) { return __primitive(a, "||", b); }
pragma "builtin" function **(a : numeric, b : numeric) { return __primitive(a, "**", b); }
pragma "builtin" function by(a : numeric, b : numeric) { return __primitive(a, "by", b); }
pragma "builtin" function ==(a : object, b : object) { return __primitive("ptr_eq", a, b); }
pragma "builtin" function !=(a : object, b : object) { return __primitive("ptr_neq", a, b); }

pragma "builtin" function Index.=(b : integer) { return __primitive("indextype_set", this, b); }
pragma "builtin" function integer.=(b : Index) { return __primitive("indextype_get", b); }
pragma "builtin" function any.=(b : any) { return b; }

pragma "builtin" function =(a : Index, b : integer) { return __primitive("indextype_set", this, b); }
pragma "builtin" function =(a : integer, b : Index) { return __primitive("indextype_get", b); }
pragma "builtin" function =(a : any, b : any) { return b; }

pragma "rename _chpl_string_concat"
function +(a : string, b : string) : string {
  return __primitive("string_op", a, b);
}

function _chpl_malloc(number, size, description: string);
function _chpl_calloc(number, size, description: string);
function _chpl_free(memory);
function _chpl_realloc(memory, number, size, description: string);

function _init_string() { return ""; }

function _UNION_CHECK(u, tag, filename, lineno);
function _UNION_SET(u, tag);
function _UNION_CHECK_QUIET(u, tag): boolean;

function _INIT_CONFIG(inout v, v_type, chapel_name, module_name);
function _INIT_ARRAY(rank, arr, dom, elt_type);
function _INIT_DOMAIN_DIM(dom, dim, lo, hi, str);

function _UnionWriteStopgap(x) { }
function _ArrayWriteStopgap(x) { }
function _EnumWriteStopgap(x) { }
function _EnumReadStopgap(x) { }
function _DomainWriteStopgap(x) { }

-- END FROM INTERNAL PRELUDE
